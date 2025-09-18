//
//  GlobalOpacity.swift
//  ObjectDetection
//
//  Created by Claude Code on 18/09/25.
//

import Foundation

/// `GlobalOpacity` struct defines opacity values for consistent transparency across the app
/// Provides standardized opacity tokens following design system patterns.
///
/// Example Usage:
/// let opacity = GlobalOpacity()
/// let transparentValue = opacity.transparent
public struct GlobalOpacity {
    
    /// Fully transparent
    public let transparent: Double = 0.0
    
    /// Light transparency
    public let light: Double = 0.1
    
    /// Medium transparency
    public let medium: Double = 0.3
    
    /// Heavy transparency
    public let heavy: Double = 0.6
    
    /// Strong transparency for overlays
    public let overlay: Double = 0.8
    
    /// Near opaque
    public let nearOpaque: Double = 0.85
    
    /// Fully opaque
    public let opaque: Double = 1.0
}