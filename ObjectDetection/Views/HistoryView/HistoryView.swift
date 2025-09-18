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
                    
                    Text("No Detection History")
                        .font(.system(size: .fontSize.large, weight: .medium))
                        .foregroundColor(.textPrimary)
                    
                    Text("Start detecting objects to see your history here")
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
                                
                                Text("Confidence: \(String(format: "%.1f%%", result.confidence * 100))")
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
            .navigationTitle("Detection History")
            .navigationBarTitleDisplayMode(.large)
        }
    }
}

#Preview {
    HistoryView()
        .environmentObject(ObjectDetector())
}