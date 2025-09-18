//
//  String+Localization.swift
//  ObjectDetection
//
//  Created by Celio Junior on 18/09/25.
//

import Foundation

/// Extension for String to provide easy localization access
/// Usage: "key".localized or "key".localized(with: arguments)
public extension String {
    
    /// Returns the localized string for the current key
    var localized: String {
        return NSLocalizedString(self, comment: "")
    }
    
    /// Returns the localized string with format arguments
    /// - Parameter arguments: Arguments to be formatted into the localized string
    /// - Returns: Formatted localized string
    func localized(with arguments: CVarArg...) -> String {
        return String(format: localized, arguments: arguments)
    }
}

/// Convenience struct for commonly used localized strings
/// Provides static access to frequently used strings
public struct LocalizedStrings {
    
    // MARK: - Camera
    public struct Camera {
        public static let accessDenied = "camera.status.access.denied".localized
        public static let failed = "camera.status.failed".localized
        public static let loading = "camera.status.loading".localized
    }
    
    // MARK: - Detection
    public struct Detection {
        public static let noObject = "detection.no.object".localized
        public static func confidence(_ value: Float) -> String {
            return "detection.confidence".localized(with: value * 100)
        }
    }
    
    // MARK: - History
    public struct History {
        public static let title = "history.title".localized
        public static let emptyTitle = "history.empty.title".localized
        public static let emptyDescription = "history.empty.description".localized
    }
    
    // MARK: - Helper
    public struct Helper {
        public static let title = "helper.title".localized
        public static let howToUse = "helper.how.to.use".localized
        public static let cameraFeatures = "helper.camera.features".localized
        public static let about = "helper.about".localized
    }
    
    // MARK: - Navigation
    public struct Navigation {
        public static let camera = "navigation.camera".localized
        public static let history = "navigation.history".localized
        public static let helper = "navigation.helper".localized
    }
}