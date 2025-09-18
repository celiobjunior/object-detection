//
//  Double+Opacity.swift
//  ObjectDetection
//
//  Created by Celio Junior on 18/09/25.
//

import Foundation

/// Extension for Double to provide global opacity tokens
/// Follows the same pattern as Inhotim design system
public extension Double {
    /// Global opacity instance for easy access
    static var opacity: GlobalOpacity { GlobalOpacity() }
}