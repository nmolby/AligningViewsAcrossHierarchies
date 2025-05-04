//
//  PostListLevel2.swift
//  AlignmentGuideExamples
//
//  Created by Nathan Molby on 4/29/25.
//

import SwiftUI

extension VerticalAlignment {
    struct CenterButton: AlignmentID {
        static func defaultValue(in context: ViewDimensions) -> CGFloat {
            context[VerticalAlignment.center]
        }
    }

    static let centerButton = VerticalAlignment(CenterButton.self)
}

struct PostListLevel2: View {
    let posts: [String]
    @State var selectedPost: String?
    @Namespace var namespace

    var body: some View {
        VStack(spacing: 20) {
            HeaderView()
            
            VStack(spacing: 20) {
                ForEach(posts, id: \.self) { post in
                    PostView(post: post)
                }
            }
            .padding(.horizontal, 20)
            
            PrimaryButton(text: "Create Post")
                .frame(maxWidth: .infinity, alignment: .trailing)
                .padding(.horizontal, 15)
                .alignmentGuide(.centerButton) { dimensions in
                    dimensions[VerticalAlignment.center]
                }

        }
        .background(alignment: .init(horizontal: .center, vertical: .centerButton)) {
            BackgroundView()
                .alignmentGuide(.centerButton) { dimensions in
                    dimensions[VerticalAlignment.bottom]
                }
        }
        
        //                .anchorPreference(key: ButtonPreferenceKey.self, value: .center, transform: { [.init(post: nil, center: $0)] })


//        .backgroundPreferenceValue(ButtonPreferenceKey.self) { preferences in
//            GeometryReader { geometry in
//                LinearGradient(colors: [Color.topGradient, Color.bottomGradient], startPoint: .top, endPoint: .bottom)
//                    .mask {
//                        RoundedRectangle(cornerRadius: 24)
//                    }
////                    .frame(height: calculateHeight(preferences: preferences, geometry: geometry))
//                
//            }

//        }
    }
    
    func calculateHeight(preferences: [ButtonPreferenceData], geometry: GeometryProxy) -> CGFloat {
        guard let buttonPreference = preferences.first(where: { $0.post == nil }) else { return 0 }
        
        if let selectedPost, let desiredPreference = preferences.first(where: { $0.post == selectedPost }) {
            return geometry[buttonPreference.center].y - geometry[desiredPreference.center].y
        } else {
            return geometry[buttonPreference.center].y
        }
    }
    
}

#Preview {
    PostListLevel2(posts: ["Post 1", "Post 2"])
        .padding(.horizontal, 10)
}
