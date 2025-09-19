//
//  HelperView+Sections.swift
//  ObjectDetection
//
//  Created by Celio Junior on 19/09/25.
//

import SwiftUI

// MARK: - Sections
extension HelperView {
    
    var howToUseSection: some View {
        HelpSection(
            title: LocalizedStrings.Helper.howToUse,
            systemImage: "info.circle.fill"
        ) {
            HelpRow(
                icon: "camera.fill",
                title: "helper.camera.tab.title".localized,
                description: "helper.camera.tab.description".localized
            )
            
            HelpRow(
                icon: "clock.fill",
                title: "helper.history.tab.title".localized,
                description: "helper.history.tab.description".localized
            )
            
            HelpRow(
                icon: "questionmark.circle.fill",
                title: "helper.helper.tab.title".localized,
                description: "helper.helper.tab.description".localized
            )
        }
    }
    
    var cameraFeaturesSection: some View {
        HelpSection(
            title: LocalizedStrings.Helper.cameraFeatures,
            systemImage: "camera.viewfinder"
        ) {
            HelpRow(
                icon: "arrow.triangle.2.circlepath.camera.fill",
                title: "helper.switch.cameras.title".localized,
                description: "helper.switch.cameras.description".localized
            )
            
            HelpRow(
                icon: "eye.fill",
                title: "helper.realtime.detection.title".localized,
                description: "helper.realtime.detection.description".localized
            )
            
            HelpRow(
                icon: "percent",
                title: "helper.confidence.score.title".localized,
                description: "helper.confidence.score.description".localized
            )
        }
    }
    
    var aboutSection: some View {
        HelpSection(
            title: LocalizedStrings.Helper.about,
            systemImage: "app.badge.fill"
        ) {
            HelpRow(
                icon: "brain.head.profile",
                title: "helper.ai.model.title".localized,
                description: "helper.ai.model.description".localized
            )
            
            HelpRow(
                icon: "iphone",
                title: "helper.ios.requirement.title".localized,
                description: "helper.ios.requirement.description".localized
            )
            
            HelpRow(
                icon: "shield.fill",
                title: "helper.privacy.title".localized,
                description: "helper.privacy.description".localized
            )
        }
    }
}