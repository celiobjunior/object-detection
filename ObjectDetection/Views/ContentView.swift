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
        TabView {
            HistoryView()
                .tabItem {
                    Image(systemName: "clock.fill")
                    Text(LocalizedStrings.Navigation.history)
                }
            
            CameraView()
                .tabItem {
                    Image(systemName: "camera.fill")
                    Text(LocalizedStrings.Navigation.camera)
                }
                .onDisappear { Task { await cameraManager.stopCapture() } }
                .onAppear { Task { await cameraManager.startCapture() } }
        }
        .environmentObject(cameraManager)
        .environmentObject(objectDetector)
    }
}


#Preview {
    ContentView()
}

