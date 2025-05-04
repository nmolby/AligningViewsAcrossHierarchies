//
//  Level1.swift
//  AlignmentGuideExamples
//
//  Created by Nathan Molby on 4/29/25.
//

import SwiftUI

struct Level1: View {
    @State var buttonVisible: Bool = true
    
    var body: some View {
        PostList(posts: ["Post 1", "Post 2"])
            .overlay(alignment: .bottomTrailing) {
                PrimaryButton(text: "Create Post")
                    .alignmentGuide(.bottom) { dimensions in
                        dimensions[VerticalAlignment.center]
                    }
                    .padding(.trailing, 15)
            }
            .padding(.horizontal, 20)
    }
}

#Preview {
    Level1()
}
