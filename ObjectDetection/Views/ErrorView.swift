//
//  ErrorView.swift
//  ObjectDetection
//
//  Created by Celio Junior on 09/09/25.
//


import SwiftUI

struct ErrorView: View {
    var error: Error?
    
    var body: some View {
        VStack {
            Text(error?.localizedDescription ?? "")
                .font(.system(size: .fontSize.small, weight: .semibold))
                .multilineTextAlignment(.center)
                .frame(maxWidth: .infinity)
                .padding(.spacing.x4)
                .foregroundColor(.white)
                .background(Color.red.edgesIgnoringSafeArea(.top))
                .opacity(error == nil ? .opacity.transparent : .opacity.opaque)
                .animation(.easeInOut(duration: .animation.fast), value: error != nil)
            
            Spacer()
        }
    }
}

#Preview {
    ErrorView(error: CameraError.cannotAddInput)
}
