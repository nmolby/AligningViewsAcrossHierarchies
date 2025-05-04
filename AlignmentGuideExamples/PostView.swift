//
//  PostView.swift
//  AlignmentGuideExamples
//
//  Created by Nathan Molby on 4/30/25.
//

import SwiftUI

struct PostView: View {
    let post: String
    
    var body: some View {
        Text(post)
            .font(.largeTitle)
            .bold()
            .padding(.vertical, 55)
            .frame(maxWidth: .infinity)
            .background {
                Color.postTan
                    .mask {
                        RoundedRectangle(cornerRadius: 24)
                    }
            }
    }
}

#Preview {
    PostView(post: "Post 1")
}
