//
//  CGFloat+FontSize.swift
//  ObjectDetection
//
//  Created by Claude Code on 18/09/25.
//

import Foundation

/// Extension for CGFloat to provide global font size tokens
/// Follows the same pattern as Inhotim design system
public extension CGFloat {
    /// Global font size instance for easy access
    static var fontSize: GlobalFontSize { GlobalFontSize { $0 } }
}