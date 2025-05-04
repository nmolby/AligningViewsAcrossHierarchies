//
//  HeaderView.swift
//  AlignmentGuideExamples
//
//  Created by Nathan Molby on 4/30/25.
//

import SwiftUI

struct HeaderView: View {
    var body: some View {
        Text("My Header")
            .frame(maxWidth: .infinity, alignment: .leading)
            .font(.largeTitle)
            .bold()
            .foregroundStyle(Color.postTan)
            .padding(.vertical, 40)
            .padding(.leading, 50)
            .background {
                Color.headerGreen
                    .mask {
                        RoundedRectangle(cornerRadius: 24)
                    }
            }
    }
}

#Preview {
    HeaderView()
}
