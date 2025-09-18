//
//  CGFloat+BorderRadius.swift
//  ObjectDetection
//
//  Created by Celio Junior on 18/09/25.
//

import Foundation

/// Extension for CGFloat to provide global border radius tokens
/// Follows the same pattern as Inhotim design system
public extension CGFloat {
    /// Global border radius instance for easy access
    static var borderRadius: GlobalBorderRadius { GlobalBorderRadius() }
}