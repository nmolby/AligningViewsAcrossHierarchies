//
//  Level1.swift
//  AlignmentGuideExamples
//
//  Created by Nathan Molby on 4/29/25.
//

import SwiftUI

struct Level3: View {
    @State var buttonVisible: Bool = true
    
    var body: some View {
        ScrollView {
            PostListLevel3(posts: ["Post 1", "Post 2", "Post 3"])
                .padding(.horizontal, 10)
                .border(.red)
        }
    }
}

#Preview {
    Level3()
}
