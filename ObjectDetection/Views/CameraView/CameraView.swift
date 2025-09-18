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
        NavigationStack {
            ZStack {
                AVCaptureView()
                    .background(.ultraThinMaterial)
                    .edgesIgnoringSafeArea(.all)
                    .overlay {
                        statusBadgeView
                    }
                    .overlay {
                        detectionOverlay
                    }
                
                VStack {
                    HStack {
                        Spacer()
                        cameraControlButtons
                            .padding(.trailing)
                    }
                    Spacer()
                }
            }
            .task(onAppear)
        }
    }
}

// MARK: - Previews

#Preview {
    CameraView()
        .environmentObject(CameraManager())
        .environmentObject(ObjectDetector())
}
