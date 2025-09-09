//
//  FrameManager.swift
//  ObjectDetection
//
//  Created by Celio Junior on 09/09/25.
//


import AVFoundation
import Vision
import CoreML
import SwiftUI

class FrameManager: NSObject, ObservableObject {
    
    static let shared = FrameManager()
    
    @Published var current: CVPixelBuffer?
    @Published var classificationResult: String = "Label"
    private var cameraManager: CameraManager?
    
    let videoOutputQueue = DispatchQueue(
        label: "com.raywenderlich.VideoOutputQ",
        qos: .userInitiated,
        attributes: [],
        autoreleaseFrequency: .workItem)
    
    private override init() {
        super.init()
    }
    
    @MainActor func configure(with cameraManager: CameraManager) {
        self.cameraManager = cameraManager
        cameraManager.captureOutput.setSampleBufferDelegate(self, queue: videoOutputQueue)
    }
}

extension FrameManager: AVCaptureVideoDataOutputSampleBufferDelegate {
    func captureOutput(
        _ output: AVCaptureOutput,
        didOutput sampleBuffer: CMSampleBuffer,
        from connection: AVCaptureConnection
    ) {
        if let buffer = sampleBuffer.imageBuffer {
            DispatchQueue.main.async {
                self.current = buffer
            }
            
            performClassification(on: sampleBuffer)
        }
    }
    
    private func performClassification(on sampleBuffer: CMSampleBuffer) {
        // Load the CoreML model directly using the generated class
        //    guard #available(iOS 17.0, *) else {
        //      print("GCModel requires iOS 17.0 or later")
        //      return
        //    }
        
        guard let model = try? Resnet50(configuration: MLModelConfiguration()).model else {
            print("Could not load Resnet50 CoreML model")
            return
        }
        
        guard let visionModel = try? VNCoreMLModel(for: model) else {
            print("Could not create VNCoreMLModel")
            return
        }
        
        let request = VNCoreMLRequest(model: visionModel) { [weak self] (finishedRequest, error) in
            guard let results = finishedRequest.results as? [VNClassificationObservation] else { return }
            guard let observation = results.first else { return }
            
            DispatchQueue.main.async {
                self?.classificationResult = "\(observation.identifier)"
                print("Classification: \(observation.identifier), Confidence: \(observation.confidence)")
            }
        }
        
        guard let pixelBuffer: CVPixelBuffer = CMSampleBufferGetImageBuffer(sampleBuffer) else { return }
        
        try? VNImageRequestHandler(cvPixelBuffer: pixelBuffer, options: [:]).perform([request])
    }
}
