//
//  HistoryView.swift
//  ObjectDetection
//
//  Created by Celio Junior on 09/09/25.
//

import SwiftUI

struct HistoryView: View {
    @EnvironmentObject var objectDetector: ObjectDetector
    
    var body: some View {
        NavigationStack {
            VStack {
                if objectDetector.detectionHistory.isEmpty {
                    Spacer()
                    
                    Image(systemName: "clock.arrow.circlepath")
                        .font(.system(size: .fontSize.x30))
                        .foregroundColor(.textSecondary)
                        .padding(.spacing.x6)
                    
                    Text(LocalizedStrings.History.emptyTitle)
                        .font(.system(size: .fontSize.large, weight: .medium))
                        .foregroundColor(.textPrimary)
                    
                    Text(LocalizedStrings.History.emptyDescription)
                        .font(.system(size: .fontSize.small))
                        .foregroundColor(.textSecondary)
                        .multilineTextAlignment(.center)
                        .padding(.horizontal, .spacing.x8)
                    
                    Spacer()
                } else {
                    List(objectDetector.detectionHistory.reversed()) { result in
                        HStack {
                            VStack(alignment: .leading, spacing: .spacing.x2) {
                                Text(result.label)
                                    .font(.system(size: .fontSize.medium, weight: .semibold))
                                    .foregroundColor(.textPrimary)
                                
                                Text(LocalizedStrings.Detection.confidence(Float(result.confidence)))
                                    .font(.system(size: .fontSize.xsmall))
                                    .foregroundColor(.textSecondary)
                            }
                            
                            Spacer()
                            
                            Text(result.timestamp, style: .time)
                                .font(.system(size: .fontSize.xsmall))
                                .foregroundColor(.textSecondary)
                        }
                        .padding(.vertical, .spacing.base)
                    }
                }
            }
            .navigationTitle(LocalizedStrings.History.title)
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    HistoryView()
        .environmentObject(ObjectDetector())
}
