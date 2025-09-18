//
//  GlobalFontSize.swift
//  ObjectDetection
//
//  Created by Celio Junior on 18/09/25.
//

import Foundation

/// `GlobalFontSize` struct is used to define font size based on global design tokens.
/// It provides a standardized way to manage font size across the app.
///
/// This struct uses a closure to transform `CGFloat` enum values into CGFloat.
///
/// Example Usage:
/// let fontSize = GlobalFontSize { $0 }
/// let viewFontSize = fontSize.small
public struct GlobalFontSize {
    /// Transformation handler that converts `CGFloat` to `CGFloat`.
    private let transformHandler: (CGFloat) -> CGFloat

    /// Initializes the `GlobalFontSize` struct with a transformation closure.
    /// - Parameter transform: A closure that takes a `CGFloat` and returns a `CGFloat`.
    init(transform: @escaping (CGFloat) -> CGFloat) {
        self.transformHandler = transform
    }

    /// Represents a font size of 'none'. (0 points)
    public var none: CGFloat {
        transformHandler(0)
    }

    /// Represents a very thin font size ('nano'). (10 points)
    public var nano: CGFloat {
        transformHandler(10)
    }

    /// Represents a xxsmall font size. (12 points)
    public var xxsmall: CGFloat {
        transformHandler(12)
    }

    /// Represents a xsmall font size. (14 points)
    public var xsmall: CGFloat {
        transformHandler(14)
    }

    /// Represents a small font size. (16 points)
    public var small: CGFloat {
        transformHandler(16)
    }

    /// Represents an medium font size. (18 points)
    public var medium: CGFloat {
        transformHandler(18)
    }

    /// Represents a large font size. (20 points)
    public var large: CGFloat {
        transformHandler(20)
    }

    /// Represents an xlarge font size. (24 points)
    public var xlarge: CGFloat {
        transformHandler(24)
    }

    /// Represents an big font size. (28 points)
    public var big: CGFloat {
        transformHandler(28)
    }

    /// Represents an xbig font size. (32 points)
    public var xbig: CGFloat {
        transformHandler(32)
    }

    /// Represents an xxbig font size. (36 points)
    public var xxbig: CGFloat {
        transformHandler(36)
    }

    /// Represents an display font size. (40 points)
    public var display: CGFloat {
        transformHandler(40)
    }

    /// Represents an xdisplay font size. (44 points)
    public var xdisplay: CGFloat {
        transformHandler(44)
    }
    
    /// Represents a x30 font size. (60 points)
    public var x30: CGFloat {
        transformHandler(60)
    }
}