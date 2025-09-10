//
//  CameraView.swift
//  ObjectDetection
//
//  Created by Celio Junior on 09/09/25.
//

import SwiftUI

// MARK: - CameraView

struct CameraView: View {

    // MARK: Properties

    @EnvironmentObject var objectDetector: ObjectDetector
    @EnvironmentObject var cameraManager: CameraManager

    // MARK: View
    
    var body: some View {
        AVCaptureView()
            .background(.ultraThinMaterial)
            .overlay(statusBadgeView)
            .overlay(alignment: .bottomTrailing) {
                switchCameraBadgeView
            }
            .task(onAppear)
    }
}

// MARK: - Previews

#Preview {
    CameraView()
        .environmentObject(CameraManager())
        .environmentObject(ObjectDetector())
}
