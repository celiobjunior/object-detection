//
//  ContentView.swift
//  ObjectDetection
//
//  Created by Celio Junior on 09/09/25.
//

import SwiftUI

struct ContentView: View {
  @StateObject private var model = ContentViewModel()
  @StateObject private var frameManager = FrameManager.shared
  
  var body: some View {
    ZStack {
      FrameView(image: model.frame)
        .edgesIgnoringSafeArea(.all)
      
      VStack {
        Spacer()
    
        Text(frameManager.classificationResult)
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
      }
      
      ErrorView(error: model.error)
    }
  }
}

#Preview {
    ContentView()
}
