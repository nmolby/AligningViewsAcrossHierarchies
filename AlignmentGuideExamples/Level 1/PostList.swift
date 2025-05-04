//
//  PostView.swift
//  AlignmentGuideExamples
//
//  Created by Nathan Molby on 4/29/25.
//

import SwiftUI

struct PostList: View {
    let posts: [String]

    var body: some View {
        VStack(spacing: 20) {
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
            
            VStack(spacing: 20) {
                ForEach(posts, id: \.self) { post in
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
            .padding(.horizontal, 20)
            .padding(.bottom, 50)
        }
        .background {
            LinearGradient(colors: [Color.topGradient, Color.bottomGradient], startPoint: .top, endPoint: .bottom)
                .mask {
                    RoundedRectangle(cornerRadius: 24)
                }
        }
    }
}

#Preview {
    PostList(posts: ["Post 1", "Post 2"])
}
