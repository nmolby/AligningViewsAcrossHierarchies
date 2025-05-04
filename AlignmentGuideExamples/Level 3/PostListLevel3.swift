//
//  PostListLevel2.swift
//  AlignmentGuideExamples
//
//  Created by Nathan Molby on 4/29/25.
//

import SwiftUI

struct PostListLevel3: View {
    let posts: [String]
    @State var selectedPost: String?
    @Namespace var namespace

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
                .opacity(0.0)
            
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
                        .anchorPreference(key: ButtonPreferenceKey.self, value: .center, transform: { [.init(post: post, center: $0)] })
                        .onTapGesture {
                            withAnimation {
                                selectedPost = post
                            }
                        }
                }
                
            }
            .padding(.horizontal, 20)
            
            HStack(spacing: 2) {
                PrimaryButton(text: "Clear Selection")
                    .onTapGesture {
                        withAnimation {
                            selectedPost = nil
                        }
                    }

                Spacer(minLength: 0)
                
                PrimaryButton(text: "Create Post")
                    .anchorPreference(key: ButtonPreferenceKey.self, value: .center, transform: { [.init(post: nil, center: $0)] })
                    .matchedGeometryEffect(id: "id", in: namespace, properties: .size, anchor: .center, isSource: true)
            }
            .padding(.horizontal, 15)
        }
        .background(alignment: .bottom) {
            Color.red
                .matchedGeometryEffect(id: "id", in: namespace, properties: .size, anchor: .center, isSource: false)
                .border(.red)
        }

//        .backgroundPreferenceValue(ButtonPreferenceKey.self) { preferences in
//            GeometryReader { geometry in
//                LinearGradient(colors: [Color.topGradient, Color.bottomGradient], startPoint: .top, endPoint: .bottom)
//                    .mask {
//                        RoundedRectangle(cornerRadius: 24)
//                    }
//                    .frame(height: calculateHeight(preferences: preferences, geometry: geometry))
//                    .offset(y: calculateOffset(preferences: preferences, geometry: geometry))
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
    
    func calculateOffset(preferences: [ButtonPreferenceData], geometry: GeometryProxy) -> CGFloat {
        guard let buttonPreference = preferences.first(where: { $0.post == nil }) else { return 0 }

        
        return geometry[buttonPreference.center].y - calculateHeight(preferences: preferences, geometry: geometry)
    }
}

#Preview {
    PostListLevel3(posts: ["Post 1", "Post 2"])
}
