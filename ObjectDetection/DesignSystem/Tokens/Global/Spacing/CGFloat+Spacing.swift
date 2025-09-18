//
//  CGFloat+Spacing.swift
//  ObjectDetection
//
//  Created by Claude Code on 18/09/25.
//

import Foundation

/// Extension for CGFloat to provide global spacing tokens
/// Follows the same pattern as Inhotim design system
public extension CGFloat {
    /// Global spacing instance for easy access
    static var spacing: GlobalSpacing { GlobalSpacing { $0 } }
}