//
//  CameraView+UI.swift
//  ObjectDetection
//
//  Created by Celio Junior on 09/09/25.
//

import SwiftUI

// MARK: - CameraView UI

extension CameraView {

    var statusBadgeView: some View {
        HStack(spacing: 16) {
            switch status {
            case .accessDenied:
                Label("Camera Access Denied", systemImage: "exclamationmark.triangle")

            case .failed:
                Label("Camera Failed", systemImage: "exclamationmark.triangle")

            case .loading:
                Label("Loading Camera", systemImage: "camera")

            case .stopped, .running, .notStarted:
                EmptyView()
            }
        }
        .padding()
        .background(.regularMaterial)
        .cornerRadius(10)
        .opacity(isBadgeHidden ? 0 : 1)
        .animation(.linear(duration: 0.1), value: status)
    }

    var switchCameraBadgeView: some View {
        Button {
            cameraManager.switchCamera()
        } label: {
            Image(systemName: "arrow.triangle.2.circlepath")
        }
        .disabled(cameraManager.currentCamera == nil)
        .padding()
        .background(.regularMaterial)
        .padding([.bottom, .trailing], 10)
        .cornerRadius(10)
        .padding([.bottom, .trailing], -10)
        .clipped()
        .opacity(cameraManager.currentCamera == nil ? 0 : 1)
    }
}
