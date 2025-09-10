//
//  ObjectResult.swift
//  ObjectDetection
//
//  Created by Celio Junior on 09/09/25.
//

import Foundation

// MARK: - ObjectResult

struct ObjectResult {

    // MARK: Properties

    let label: String
    let confidence: Double
    let output: Resnet50Output

    // MARK: Initializers

    init?(output prediction: Resnet50Output) {
        guard let confidence = prediction.classLabelProbs[prediction.classLabel],
              confidence >= 0.3
        else { return nil }

        let cleanedLabel = Self.cleanLabel(prediction.classLabel)
        
        self.label = cleanedLabel
        self.confidence = confidence
        self.output = prediction
    }
}

// MARK: - Private Helpers

private extension ObjectResult {
    
    // ResNet50 often returns labels with technical IDs
    // ResNet50 labels often come in format like "n02123045 tabby, tabby cat"
    static func cleanLabel(_ rawLabel: String) -> String {

        let components = rawLabel.components(separatedBy: ",")
        let firstComponent = components.first ?? rawLabel
        
        let cleaned = firstComponent.replacingOccurrences(
            of: #"^n\d+\s+"#,
            with: "",
            options: .regularExpression
        )
        
        return cleaned.prefix(1).uppercased() + cleaned.dropFirst().lowercased()
    }
}
