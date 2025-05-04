//
//  BackgroundView.swift
//  AlignmentGuideExamples
//
//  Created by Nathan Molby on 4/30/25.
//

import SwiftUI

struct BackgroundView: View {
    var body: some View {
        LinearGradient(colors: [Color.topGradient, Color.bottomGradient], startPoint: .top, endPoint: .bottom)
            .mask {
                RoundedRectangle(cornerRadius: 24)
            }
    }
}

#Preview {
    BackgroundView()
}
