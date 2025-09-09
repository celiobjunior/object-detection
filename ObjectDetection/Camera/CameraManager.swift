//
//  CameraManager.swift
//  ObjectDetection
//
//  Created by Celio Junior on 09/09/25.
//

import AVFoundation
import SwiftUI

// MARK: - CameraManager

@MainActor class CameraManager: ObservableObject {

    // MARK: Properties

    @Published private(set) var setupStatus: SetupStatus = .notStarted
    @Published private(set) var runStatus: RunStatus = .stopped
    @Published private(set) var currentCamera: AVCaptureDevice.Position? = nil
    @Published var error: CameraError?
    
    let captureSession = AVCaptureSession()
    let captureOutput = AVCaptureVideoDataOutput()

    private var frontCamera: AVCaptureDeviceInput?
    private var backCamera: AVCaptureDeviceInput?
    
    // MARK: Enums
    
    enum SetupStatus {
        case notStarted, loading, success, failed
        case accessDenied, accessRestricted
    }

    enum RunStatus: CaseIterable {
        case stopped, loading, running
    }
}

// MARK: - Publics

extension CameraManager {

    func setupCamera() async {
        guard setupStatus == .notStarted else { return }

        setupStatus = .loading
        
        let hasPermission = await checkAndRequestPermissions()

        guard hasPermission else {
            return
        }

        guard await setupCapture() else {
            setupStatus = .failed
            error = .cameraUnavailable
            return
        }

        setupStatus = .success
    }

    func startCapture() async {
        guard setupStatus == .success, runStatus == .stopped else { return }

        runStatus = .loading

        await Task.detached {
            self.captureSession.startRunning()
        }.value

        runStatus = .running
    }

    func stopCapture() async {
        guard setupStatus == .success, runStatus == .running else { return }

        runStatus = .loading

        await Task.detached {
            self.captureSession.stopRunning()
        }.value

        runStatus = .stopped
    }

    func switchCamera() {
        guard let frontCamera, let backCamera else { return }

        switch currentCamera {
        case .front:
            captureSession.removeInput(frontCamera)
            captureSession.addInput(backCamera)
            currentCamera = .back

        case .back:
            captureSession.removeInput(backCamera)
            captureSession.addInput(frontCamera)
            currentCamera = .front

        default:
            break
        }
    }
}

// MARK: - Privates

private extension CameraManager {

    func checkAndRequestPermissions() async -> Bool {
        switch AVCaptureDevice.authorizationStatus(for: .video) {
            case .authorized:
                return true
            case .notDetermined:
                let granted = await AVCaptureDevice.requestAccess(for: .video)
                if !granted {
                    setupStatus = .accessDenied
                    error = .deniedAuthorization
                }
                return granted
            case .restricted:
                setupStatus = .accessRestricted
                error = .restrictedAuthorization
                return false
            case .denied:
                setupStatus = .accessDenied
                error = .deniedAuthorization
                return false
            @unknown default:
                setupStatus = .failed
                error = .unknownAuthorization
                return false
        }
    }

//    func setupCapture() async -> Bool {
//        captureSession.sessionPreset = .vga640x480
//        captureSession.beginConfiguration()
//
//        guard
//            await setupInputs(),
//            captureSession.canAddOutput(captureOutput)
//        else { return false }
//
//        captureOutput.connection(with: .video)?.isEnabled = true
//        captureOutput.alwaysDiscardsLateVideoFrames = true
//        captureOutput.connection(with: .video)?.isVideoMirrored = true
//
//        captureSession.addOutput(captureOutput)
//
//        captureSession.commitConfiguration()
//        return true
//    }
    
    private func setupCapture() async -> Bool {
        captureSession.beginConfiguration()
        defer { captureSession.commitConfiguration() }
        
        captureSession.sessionPreset = .high
        
        // Configura inputs
        guard await setupInputs() else { return false }
        
        // Configura output
        guard captureSession.canAddOutput(captureOutput) else {
            error = .cannotAddOutput
            return false
        }
        
        captureOutput.alwaysDiscardsLateVideoFrames = true
        captureSession.addOutput(captureOutput)
        
        // Configura orientação e espelhamento baseado na câmera
        if let connection = captureOutput.connection(with: .video) {
            connection.videoOrientation = .portrait
            // Espelha apenas a câmera frontal
            connection.isVideoMirrored = (currentCamera == .front)
        }
        
        return true
    }

    func setupInputs() async -> Bool {
        async let frontCameraInput: AVCaptureDeviceInput? = await Task.detached {
            guard let camera: AVCaptureDevice = .default(
                .builtInWideAngleCamera,
                for: .video,
                position: .front
            ) else { return nil }

            return try? .init(device: camera)
        }.value

        async let backCameraInput: AVCaptureDeviceInput? = await Task.detached {
            guard let camera: AVCaptureDevice = .default(
                .builtInWideAngleCamera,
                for: .video,
                position: .back
            ) else { return nil }

            return try? .init(device: camera)
        }.value

        (frontCamera, backCamera) = await (frontCameraInput, backCameraInput)

        switch (frontCamera, backCamera) {
        case (.some, .some(let backCamera)):
            currentCamera = .back
            captureSession.addInput(backCamera)
            return true

        case (.some(let frontCamera), .none):
            captureSession.addInput(frontCamera)
            return true

        case (.none, .some(let backCamera)):
            captureSession.addInput(backCamera)
            return true

        case (.none, .none):
            return false
        }
    }
}
