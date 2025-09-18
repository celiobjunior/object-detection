//
//  GlobalAnimation.swift
//  ObjectDetection
//
//  Created by Celio Junior on 18/09/25.
//

import Foundation

/// `GlobalAnimation` struct defines animation duration constants for consistent timing
/// Provides standardized animation tokens following design system patterns.
///
/// Example Usage:
/// let animation = GlobalAnimation()
/// let fastDuration = animation.fast
public struct GlobalAnimation {
    
    /// Quick animations (0.1 seconds)
    public let quick: Double = 0.1
    
    /// Fast animations (0.2 seconds)
    public let fast: Double = 0.2
    
    /// Standard animations (0.3 seconds)
    public let standard: Double = 0.3
    
    /// Slow animations (0.5 seconds)
    public let slow: Double = 0.5
    
    /// Very slow animations (0.8 seconds)
    public let verySlow: Double = 0.8
}