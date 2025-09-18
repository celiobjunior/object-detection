//
//  HelperView.swift
//  ObjectDetection
//
//  Created by Celio Junior on 09/09/25.
//

import SwiftUI

struct HelperView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: .spacing.x10) {
                    
                    VStack(alignment: .leading, spacing: .spacing.x6) {
                        Label("How to Use", systemImage: "info.circle.fill")
                            .font(.system(size: .fontSize.medium, weight: .semibold))
                            .foregroundColor(.feedbackSuccess)
                        
                        VStack(alignment: .leading, spacing: .spacing.x4) {
                            HelpRow(icon: "camera.fill", title: "Camera Tab", description: "Point your camera at objects to detect and classify them in real-time")
                            HelpRow(icon: "clock.fill", title: "History Tab", description: "View all your previous object detections with timestamps")
                            HelpRow(icon: "questionmark.circle.fill", title: "Helper Tab", description: "Get help and information about the app")
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: .spacing.x6) {
                        Label("Camera Features", systemImage: "camera.viewfinder")
                            .font(.system(size: .fontSize.medium, weight: .semibold))
                            .foregroundColor(.feedbackSuccess)
                        
                        VStack(alignment: .leading, spacing: .spacing.x4) {
                            HelpRow(icon: "arrow.triangle.2.circlepath.camera.fill", title: "Switch Cameras", description: "Tap to switch between front and back cameras")
                            HelpRow(icon: "eye.fill", title: "Real-time Detection", description: "Objects are detected automatically as you point the camera")
                            HelpRow(icon: "percent", title: "Confidence Score", description: "See how confident the AI is about each detection")
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: .spacing.x6) {
                        Label("About", systemImage: "app.badge.fill")
                            .font(.system(size: .fontSize.medium, weight: .semibold))
                            .foregroundColor(.textPrimary)
                        
                        VStack(alignment: .leading, spacing: .spacing.x4) {
                            HelpRow(icon: "brain.head.profile", title: "AI Model", description: "Uses ResNet50 CoreML model for object classification")
                            HelpRow(icon: "iphone", title: "iOS 18.5+", description: "Requires iOS 18.5 or later to run")
                            HelpRow(icon: "shield.fill", title: "Privacy", description: "All processing happens on your device - no data is sent to servers")
                        }
                    }
                    
                    Spacer(minLength: .spacing.x10)
                }
                .padding(.spacing.x8)
            }
            .navigationTitle("Help & Info")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct HelpRow: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: .spacing.x6) {
            Image(systemName: icon)
                .font(.system(size: .fontSize.small, weight: .medium))
                .foregroundColor(.textPrimary)
                .frame(width: .spacing.x10)
            
            VStack(alignment: .leading, spacing: .spacing.base) {
                Text(title)
                    .font(.system(size: .fontSize.small, weight: .medium))
                    .foregroundColor(.textPrimary)
                
                Text(description)
                    .font(.system(size: .fontSize.xsmall))
                    .foregroundColor(.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

#Preview {
    HelperView()
}