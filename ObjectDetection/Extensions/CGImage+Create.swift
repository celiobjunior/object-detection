//
//  CGImage+Create.swift
//  ObjectDetection
//
//  Created by Celio Junior on 09/09/25.
//


import CoreGraphics
import VideoToolbox

extension CGImage {
  static func create(from cvPixelBuffer: CVPixelBuffer?) -> CGImage? {
    
    guard let pixelBuffer = cvPixelBuffer else {
      return nil
    }

    var image: CGImage?
    
    VTCreateCGImageFromCVPixelBuffer(
      pixelBuffer,
      options: nil,
      imageOut: &image
    )
    
    return image
  }
}
