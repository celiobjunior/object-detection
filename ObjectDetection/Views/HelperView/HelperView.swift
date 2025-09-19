//
//  HelperView.swift
//  ObjectDetection
//
//  Created by Celio Junior on 09/09/25.
//

import SwiftUI

struct HelperView: View {
    
    // MARK: - Body
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(alignment: .leading, spacing: .spacing.x10) {
                    howToUseSection
                    Divider()
                    cameraFeaturesSection
                    Divider()
                    aboutSection
                    Spacer(minLength: .spacing.x10)
                }
                .padding(.spacing.x8)
            }
            .navigationTitle(LocalizedStrings.Helper.title)
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

// MARK: - Preview
#Preview {
    HelperView()
}
