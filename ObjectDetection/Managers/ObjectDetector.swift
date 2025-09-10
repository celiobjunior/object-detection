//
//  ObjectDetector.swift
//  ObjectDetection
//
//  Created by Celio Junior on 09/09/25.
//

import SwiftUI
import Vision
import CoreML

// MARK: - ObjectDetector

@MainActor class ObjectDetector: ObservableObject {

    // MARK: Properties

    @Published private(set) var setupStatus: SetupStatus = .notStarted
    @Published private(set) var currentResult: ObjectResult? = nil

    private(set) var model: Resnet50? = nil
    
    // MARK: Enums

    enum SetupStatus: CaseIterable {
        case notStarted, loading, success, failed
    }
}

// MARK: - Publics

extension ObjectDetector {

    // MARK: Functions

    func setup() async {
        await setupModels()
    }
    
//    func start() async {
//        do {
//            try await setupModel()
//        } catch {
//            print(error.localizedDescription)
//            setupStatus = .failed
//            return
//        }
//    }

    nonisolated func onImageReceived(buffer imageBuffer: CVImageBuffer) {
        Task {
            await MainActor.run {
                if let result = try? getObjectResult(buffer: imageBuffer) {
                    currentResult = result
                }
            }
        }
    }
}

// MARK: - Privates

private extension ObjectDetector {

    // MARK: Functions

    func setupModels() async {
        guard setupStatus == .notStarted else { return }

        var modelURL: URL?
        
        if let url = Bundle.main.url(forResource: "Resnet50", withExtension: "mlmodelc", subdirectory: "Resnet50.mlmodelc") {
            modelURL = url
        }
        else {
            modelURL = Resnet50.urlOfModelInThisBundle
        }
        
        guard let finalURL = modelURL else {
            print("ML Model (Resnet50.mlmodelc) not found in any expected location.")
            setupStatus = .failed
            return
        }
        
        print("Loading Resnet50 model from: \(finalURL)")
        setupStatus = .loading

        do {
            let model: Resnet50 = try await Task.detached {
                try .init(contentsOf: finalURL)
            }.value

            self.model = model
        } catch {
            print(error.localizedDescription)
            setupStatus = .failed
            return
        }

        setupStatus = .success
    }

    func getObjectResult(buffer imageBuffer: CVImageBuffer) throws -> ObjectResult? {
        guard setupStatus == .success else { return nil }
        guard let model = model else { return nil }

        let visionModel = try VNCoreMLModel(for: model.model)
        let request = VNCoreMLRequest(model: visionModel)
        
        request.imageCropAndScaleOption = .centerCrop
        
        let handler = VNImageRequestHandler(cvPixelBuffer: imageBuffer, options: [:])
        try handler.perform([request])
        
        guard let results = request.results as? [VNClassificationObservation],
              let topResult = results.first else { return nil }
        
        let classLabelProbs = results.reduce(into: [String: Double]()) { dict, observation in
            dict[observation.identifier] = Double(observation.confidence)
        }
        
        let resnetOutput = Resnet50Output(
            classLabelProbs: classLabelProbs,
            classLabel: topResult.identifier
        )
        
        return ObjectResult(output: resnetOutput)
    }
}
