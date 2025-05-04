//
//  Level1.swift
//  AlignmentGuideExamples
//
//  Created by Nathan Molby on 4/29/25.
//

import SwiftUI

struct Level2: View {
    @State var buttonVisible: Bool = true
    
    var body: some View {
        ScrollView {
            PostListLevel2(posts: ["Post 1", "Post 2", "Post 3"])
                .padding(.horizontal, 20)
                .border(.red)
        }
    }
}

#Preview {
    Level2()
}
