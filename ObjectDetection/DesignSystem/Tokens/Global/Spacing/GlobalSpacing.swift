//
//  GlobalSpacing.swift
//  ObjectDetection
//
//  Created by Claude Code on 18/09/25.
//

import Foundation

/// `GlobalSpacing` is used to define spacing based on global design tokens.
/// It provides a standardized way to manage spacing across the app.
///
/// This struct uses a closure to transform `CGFloat` enum values into CGFloat.
///
/// Example Usage:
/// let spacing = GlobalSpacing { $0 }
/// let baseSpacing = spacing.base
public struct GlobalSpacing {
    /// Transformation handler that converts `CGFloat` to `CGFloat`.
    private let transformHandler: (CGFloat) -> CGFloat

    /// Initializes the `GlobalSpacing` struct with a transformation closure.
    /// - Parameter transform: A closure that takes a `CGFloat` and returns a `CGFloat`.
    init(transform: @escaping (CGFloat) -> CGFloat) {
        self.transformHandler = transform
    }

    /// Represents a spacing of 'none'. (0 points)
    public var none: CGFloat { transformHandler(0) }

    /// Represents the base spacing. (2 points)
    public var base: CGFloat { transformHandler(2) }

    /// Represents double the base spacing. (4 points)
    public var x2: CGFloat { transformHandler(2 * base) }

    /// Represents triple the base spacing. (6 points)
    public var x3: CGFloat { transformHandler(3 * base) }

    /// Represents quadruple the base spacing. (8 points)
    public var x4: CGFloat { transformHandler(4 * base) }

    /// Represents quintuple the base spacing. (10 points)
    public var x5: CGFloat { transformHandler(5 * base) }

    /// Represents sextuple the base spacing. (12 points)
    public var x6: CGFloat { transformHandler(6 * base) }

    /// Represents septuple the base spacing. (14 points)
    public var x7: CGFloat { transformHandler(7 * base) }

    /// Represents octuple the base spacing. (16 points)
    public var x8: CGFloat { transformHandler(8 * base) }

    /// Represents nonuple the base spacing. (18 points)
    public var x9: CGFloat { transformHandler(9 * base) }

    /// Represents decuple the base spacing. (20 points)
    public var x10: CGFloat { transformHandler(10 * base) }

    /// Represents undecuple the base spacing. (24 points)
    public var x12: CGFloat { transformHandler(12 * base) }

    /// Represents duodecuple the base spacing. (28 points)
    public var x14: CGFloat { transformHandler(14 * base) }

    /// Represents tredecuple the base spacing. (32 points)
    public var x16: CGFloat { transformHandler(16 * base) }

    /// Represents quatrodecuple the base spacing. (36 points)
    public var x18: CGFloat { transformHandler(18 * base) }

    /// Represents quindecuple the base spacing. (40 points)
    public var x20: CGFloat { transformHandler(20 * base) }

    /// Represents sexdecuple the base spacing. (44 points)
    public var x22: CGFloat { transformHandler(22 * base) }

    /// Represents septendecuple the base spacing. (48 points)
    public var x24: CGFloat { transformHandler(24 * base) }

    /// Represents octodecuple the base spacing. (52 points)
    public var x26: CGFloat { transformHandler(26 * base) }

    /// Represents nonodecuple the base spacing. (56 points)
    public var x28: CGFloat { transformHandler(28 * base) }

    /// Represents duodecuple the base spacing. (60 points)
    public var x30: CGFloat { transformHandler(30 * base) }

    /// Represents tredecuple the base spacing. (64 points)
    public var x32: CGFloat { transformHandler(32 * base) }

    /// Represents quatrodecuple the base spacing. (100 points)
    public var x50: CGFloat { transformHandler(50 * base) }
}