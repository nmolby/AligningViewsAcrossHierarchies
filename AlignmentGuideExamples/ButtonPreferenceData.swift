//
//  ButtonPreferenceData.swift
//  AlignmentGuideExamples
//
//  Created by Nathan Molby on 4/30/25.
//

import SwiftUI

struct ButtonPreferenceData {
    let post: String?
    let center: Anchor<CGPoint>
}

struct ButtonPreferenceKey: PreferenceKey {
    typealias Value = [ButtonPreferenceData]
    
    static var defaultValue: [ButtonPreferenceData] = []
    
    static func reduce(value: inout [ButtonPreferenceData], nextValue: () -> [ButtonPreferenceData]) {
        value.append(contentsOf: nextValue())
    }
}
