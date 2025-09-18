//
//  HelperView.swift
//  ObjectDetection
//
//  Created by Celio Junior on 09/09/25.
//

import SwiftUI

struct HelperView: View {
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: .spacing.x10) {
                    
                    VStack(alignment: .leading, spacing: .spacing.x6) {
                        Label(LocalizedStrings.Helper.howToUse, systemImage: "info.circle.fill")
                            .font(.system(size: .fontSize.medium, weight: .semibold))
                            .foregroundColor(.feedbackSuccess)
                        
                        VStack(alignment: .leading, spacing: .spacing.x4) {
                            HelpRow(icon: "camera.fill", title: "helper.camera.tab.title".localized, description: "helper.camera.tab.description".localized)
                            HelpRow(icon: "clock.fill", title: "helper.history.tab.title".localized, description: "helper.history.tab.description".localized)
                            HelpRow(icon: "questionmark.circle.fill", title: "helper.helper.tab.title".localized, description: "helper.helper.tab.description".localized)
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: .spacing.x6) {
                        Label(LocalizedStrings.Helper.cameraFeatures, systemImage: "camera.viewfinder")
                            .font(.system(size: .fontSize.medium, weight: .semibold))
                            .foregroundColor(.feedbackSuccess)
                        
                        VStack(alignment: .leading, spacing: .spacing.x4) {
                            HelpRow(icon: "arrow.triangle.2.circlepath.camera.fill", title: "helper.switch.cameras.title".localized, description: "helper.switch.cameras.description".localized)
                            HelpRow(icon: "eye.fill", title: "helper.realtime.detection.title".localized, description: "helper.realtime.detection.description".localized)
                            HelpRow(icon: "percent", title: "helper.confidence.score.title".localized, description: "helper.confidence.score.description".localized)
                        }
                    }
                    
                    Divider()
                    
                    VStack(alignment: .leading, spacing: .spacing.x6) {
                        Label(LocalizedStrings.Helper.about, systemImage: "app.badge.fill")
                            .font(.system(size: .fontSize.medium, weight: .semibold))
                            .foregroundColor(.textPrimary)
                        
                        VStack(alignment: .leading, spacing: .spacing.x4) {
                            HelpRow(icon: "brain.head.profile", title: "helper.ai.model.title".localized, description: "helper.ai.model.description".localized)
                            HelpRow(icon: "iphone", title: "helper.ios.requirement.title".localized, description: "helper.ios.requirement.description".localized)
                            HelpRow(icon: "shield.fill", title: "helper.privacy.title".localized, description: "helper.privacy.description".localized)
                        }
                    }
                    
                    Spacer(minLength: .spacing.x10)
                }
                .padding(.spacing.x8)
            }
            .navigationTitle(LocalizedStrings.Helper.title)
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

struct HelpRow: View {
    let icon: String
    let title: String
    let description: String
    
    var body: some View {
        HStack(alignment: .top, spacing: .spacing.x6) {
            Image(systemName: icon)
                .font(.system(size: .fontSize.small, weight: .medium))
                .foregroundColor(.textPrimary)
                .frame(width: .spacing.x10)
            
            VStack(alignment: .leading, spacing: .spacing.base) {
                Text(title)
                    .font(.system(size: .fontSize.small, weight: .medium))
                    .foregroundColor(.textPrimary)
                
                Text(description)
                    .font(.system(size: .fontSize.xsmall))
                    .foregroundColor(.textSecondary)
                    .fixedSize(horizontal: false, vertical: true)
            }
        }
    }
}

#Preview {
    HelperView()
}