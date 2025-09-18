//
//  CameraError.swift
//  ObjectDetection
//
//  Created by Celio Junior on 09/09/25.
//


import Foundation

enum CameraError: Error {
    case cameraUnavailable
    case cannotAddInput
    case cannotAddOutput
    case createCaptureInput(Error)
    case deniedAuthorization
    case restrictedAuthorization
    case unknownAuthorization
}

extension CameraError: LocalizedError {
    var errorDescription: String? {
        switch self {
        case .cameraUnavailable:
            return "camera.error.unavailable".localized
        case .cannotAddInput:
            return "camera.error.cannot.add.input".localized
        case .cannotAddOutput:
            return "camera.error.cannot.add.output".localized
        case .createCaptureInput(let error):
            return "Creating capture input for camera: \(error.localizedDescription)"
        case .deniedAuthorization:
            return "camera.error.authorization.denied".localized
        case .restrictedAuthorization:
            return "camera.error.authorization.restricted".localized
        case .unknownAuthorization:
            return "camera.error.authorization.unknown".localized
        }
    }
}
