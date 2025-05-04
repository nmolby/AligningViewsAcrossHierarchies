//
//  ContentView.swift
//  AlignmentGuideExamples
//
//  Created by Nathan Molby on 4/29/25.
//

import SwiftUI

struct ContentView: View {

    var body: some View {
        TabView {
            Tab("Level 1", systemImage: "1.circle") {
                Level1()
                    .padding(.horizontal, 20)
            }

                
        }

    }
}



#Preview {
    ContentView()
}
