//
//  ContentView.swift
//  ObjectDetection
//
//  Created by Celio Junior on 09/09/25.
//

import SwiftUI

struct ContentView: View {
    @StateObject var cameraManager = CameraManager()
    @StateObject var objectDetector = ObjectDetector()
    
    var body: some View {
        ZStack {
            CameraView()
                .edgesIgnoringSafeArea(.all)
            
            VStack {
                Spacer()
                
                Text(objectDetector.currentResult?.label ?? "No object detected")
                    .font(.system(size: 18, weight: .semibold))
                    .foregroundColor(.green)
                    .multilineTextAlignment(.center)
                    .padding(.horizontal, 24)
                    .padding(.vertical, 16)
                    .background(
                        RoundedRectangle(cornerRadius: 8)
                            .fill(Color.black.opacity(0.85))
                    )
                    .padding(.bottom, 40)
                
                if let confidence = objectDetector.currentResult?.confidence {
                    Text("Confidence: \(String(format: "%.1f%%", confidence * 100))")
                        .font(.system(size: 14, weight: .medium))
                        .foregroundColor(.white.opacity(0.8))
                        .padding(.bottom, 20)
                }
            }
            
            ErrorView(error: cameraManager.error)
        }
        .environmentObject(cameraManager)
        .environmentObject(objectDetector)
    }
}

#Preview {
    ContentView()
}
