//
//  HelperView+Components.swift
//  ObjectDetection
//
//  Created by Celio Junior on 19/09/25.
//

import SwiftUI

// MARK: - Components
struct HelpSection<Content: View>: View {
    let title: String
    let systemImage: String
    let content: Content
    
    init(title: String, systemImage: String, @ViewBuilder content: () -> Content) {
        self.title = title
        self.systemImage = systemImage
        self.content = content()
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: .spacing.x6) {
            Label(title, systemImage: systemImage)
                .font(.system(size: .fontSize.medium, weight: .semibold))
                .foregroundColor(.feedbackSuccess)
            
            VStack(alignment: .leading, spacing: .spacing.x4) {
                content
            }
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
