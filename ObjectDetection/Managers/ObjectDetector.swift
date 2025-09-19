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
    @Published private(set) var detectionHistory: [ObjectResult] = []

    private(set) var model: Resnet50? = nil
    private var visionModel: VNCoreMLModel? = nil

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
    
    nonisolated func onImageReceived(buffer imageBuffer: CVImageBuffer) {
        
        Task.detached { [weak self] in
            guard let self = self else { return }
            
            let result = await self.processImage(buffer: imageBuffer)
            
            await MainActor.run {
                guard let result = result else { return }
                self.currentResult = result
                self.detectionHistory.append(result)
                
                if self.detectionHistory.count > 100 {
                    self.detectionHistory.removeFirst()
                }
            }
        }
    }
    
    nonisolated func processImage(buffer imageBuffer: CVImageBuffer) async -> ObjectResult? {
        guard await setupStatus == .success else { return nil }
        guard let visionModel = await visionModel else { return nil }
        
        do {
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
        } catch {
            print("Error processing image: \(error)")
            return nil
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
            
            // Prepara o VNCoreMLModel para uso posterior
            self.visionModel = try? VNCoreMLModel(for: model.model)
            
        } catch {
            print(error.localizedDescription)
            setupStatus = .failed
            return
        }

        setupStatus = .success
    }
}
