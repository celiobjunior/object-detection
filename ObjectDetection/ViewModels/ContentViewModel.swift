//
//  ContentViewModel.swift
//  ObjectDetection
//
//  Created by Celio Junior on 09/09/25.
//


import CoreImage

class ContentViewModel: ObservableObject {

  @Published var frame: CGImage?
  @Published var error: Error?
  private let frameManager = FrameManager.shared
  private let cameraManager = CameraManager.shared
  
  init() {
    setupSubscriptions()
  }

  func setupSubscriptions() {
    // Basic frame subscription without filtering
    frameManager.$current
      .receive(on: RunLoop.main)
      .compactMap { buffer in
        return CGImage.create(from: buffer)
      }
      .assign(to: &$frame)
    
    cameraManager.$error
      .receive(on: RunLoop.main)
      .map { $0 }
      .assign(to: &$error)
  }
}
