//
//  PrimaryButton.swift
//  AlignmentGuideExamples
//
//  Created by Nathan Molby on 4/29/25.
//

import SwiftUI

struct PrimaryButton: View {
    let text: String
    
    var body: some View {
        Text(text)
            .font(.title2)
            .padding(20)
            .background {
                Color.primaryButton
                    .mask {
                        RoundedRectangle(cornerRadius: 8)
                    }
            }
    }
}

#Preview {
    PrimaryButton(text: "Create Post")
}
