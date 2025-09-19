//
//  Color+ObjectDetection.swift
//  ObjectDetection
//
//  Created by Celio Junior on 18/09/25.
//

import SwiftUI

/// Extension for SwiftUI Color to provide ObjectDetection app color tokens
/// Simplified structure for project scope
public extension Color {
    
    // MARK: - Icon Colors
    /// Primary icon color (adaptive for dark/light mode)
    static var iconPrimary: Color { Color.primary }
    
    // MARK: - Feedback Colors
    /// Success color for positive feedback
    static var feedbackSuccess: Color { .green }
    /// Error color for negative feedback
    static var feedbackError: Color { .red }
    
    // MARK: - Text Colors
    /// Primary text color (adaptive for dark/light mode)
    static var textPrimary: Color { Color.primary }
    /// Secondary text color (adaptive for dark/light mode)
    static var textSecondary: Color { Color.secondary }
    /// Light text color for overlays
    static var textLight: Color { .white.opacity(0.8) }
    
    // MARK: - Background Colors
    /// Semi-transparent overlay background
    static var backgroundOverlay: Color { .black.opacity(0.85) }
    /// Light overlay background
    static var backgroundLight: Color { .white.opacity(0.8) }
}

/// Extension for SwiftUI ShapeStyle to provide ObjectDetection app color tokens
/// Allows colors to be used in .fill() and other ShapeStyle contexts
public extension ShapeStyle where Self == Color {
    
    // MARK: - Icon Colors
    /// Primary icon color (adaptive for dark/light mode)
    static var iconPrimary: Color { Color.primary }
    
    // MARK: - Feedback Colors
    /// Success color for positive feedback
    static var feedbackSuccess: Color { .green }
    /// Error color for negative feedback
    static var feedbackError: Color { .red }
    
    // MARK: - Text Colors
    /// Primary text color (adaptive for dark/light mode)
    static var textPrimary: Color { Color.primary }
    /// Secondary text color (adaptive for dark/light mode)
    static var textSecondary: Color { Color.secondary }
    /// Light text color for overlays
    static var textLight: Color { .white.opacity(0.8) }
    
    // MARK: - Background Colors
    /// Semi-transparent overlay background
    static var backgroundOverlay: Color { .black.opacity(0.85) }
    /// Light overlay background
    static var backgroundLight: Color { .white.opacity(0.8) }
}