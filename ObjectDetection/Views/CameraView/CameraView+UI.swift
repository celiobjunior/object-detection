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
        HStack(spacing: .spacing.x8) {
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
        .padding(.spacing.x6)
        .background(.regularMaterial)
        .cornerRadius(.borderRadius.large)
        .opacity(isBadgeHidden ? .opacity.transparent : .opacity.opaque)
        .animation(.linear(duration: .animation.quick), value: status)
    }

    var helpButton: some View {
        NavigationLink(destination: HelperView()) {
            Image(systemName: "info")
                .font(.system(size: .fontSize.big))
                .foregroundColor(.iconPrimary)
                .padding(.spacing.x6)
        }
    }
    
    var switchButton: some View {
        Button {
            cameraManager.switchCamera()
        } label: {
            Image(systemName: "arrow.triangle.2.circlepath")
                .font(.system(size: .fontSize.big))
                .foregroundColor(.iconPrimary)
                .padding(.spacing.x6)
        }
        .disabled(cameraManager.currentCamera == nil)
        .opacity(cameraManager.currentCamera == nil ? .opacity.transparent : .opacity.opaque)
    }
    
    @ViewBuilder
    var cameraControlButtons: some View {
        if #available(iOS 26.0, macOS 26.0, visionOS 26.0, *) {
            GlassEffectContainer {
                HStack(spacing: .spacing.x3) {
                    helpButton
                        .glassEffect(.clear.interactive(), in: .circle)
                    switchButton
                        .glassEffect(.clear.interactive(), in: .circle)
                }
            }
        }
        else {
            HStack(spacing: .spacing.x3) {
                helpButton
                switchButton
            }
        }
    }
    
    var objectResultLabel: some View {
        Text(objectDetector.currentResult?.label ?? "No object detected")
            .font(.system(size: .fontSize.medium, weight: .semibold))
            .foregroundColor(.feedbackSuccess)
            .multilineTextAlignment(.center)
            .padding(.horizontal, .spacing.x12)
            .padding(.vertical, .spacing.x8)
            .background(
                RoundedRectangle(cornerRadius: .borderRadius.medium)
                    .fill(.backgroundOverlay)
            )
            .padding(.bottom, .spacing.x20)
    }
    
    var confidenceLabel: some View {
        Group {
            if let confidence = objectDetector.currentResult?.confidence {
                Text("Confidence: \(String(format: "%.1f%%", confidence * 100))")
                    .font(.system(size: .fontSize.xsmall, weight: .medium))
                    .foregroundColor(.textLight)
                    .padding(.bottom, .spacing.x10)
            }
        }
    }
    
    var detectionOverlay: some View {
        VStack {
            Spacer()
            
            objectResultLabel
            confidenceLabel
        }
        .padding(.bottom, .spacing.x16)
    }
}
