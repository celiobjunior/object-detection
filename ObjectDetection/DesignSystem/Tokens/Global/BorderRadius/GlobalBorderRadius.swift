//
//  GlobalBorderRadius.swift
//  ObjectDetection
//
//  Created by Celio Junior on 18/09/25.
//

import Foundation

/// `GlobalBorderRadius` struct defines border radius values for consistent corner styling
/// Provides standardized border radius tokens following design system patterns.
///
/// Example Usage:
/// let borderRadius = GlobalBorderRadius()
/// let mediumRadius = borderRadius.medium
public struct GlobalBorderRadius {
    
    /// No radius
    public let none: CGFloat = 0
    
    /// Small radius (4 points)
    public let small: CGFloat = 4
    
    /// Medium radius (8 points)
    public let medium: CGFloat = 8
    
    /// Large radius (12 points)
    public let large: CGFloat = 12
    
    /// Extra large radius (16 points)
    public let xlarge: CGFloat = 16
    
    /// Circle - creates perfect circle
    public let circle: CGFloat = .infinity
}