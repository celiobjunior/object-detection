//
//  Double+Animation.swift
//  ObjectDetection
//
//  Created by Celio Junior on 18/09/25.
//

import Foundation

/// Extension for Double to provide global animation tokens
/// Follows the same pattern as Inhotim design system
public extension Double {
    /// Global animation instance for easy access
    static var animation: GlobalAnimation { GlobalAnimation() }
}