//
//  ScrollData.swift
//  Project_8
//
//  Created by MICHAIL SHAKHVOROSTOV on 19.09.2023.
//

import SwiftUI

struct CustomTextView: View {
    
    let text: String
    
    var body: some View {
        Text(text)
    }
    
    init(_ text: String) {
        print("Creating customText \(text)")
        self.text = text
    }
}

struct ScrollData: View {
    var body: some View {
        ScrollView(.horizontal) {
            LazyHStack(spacing: 10) {
                ForEach(0..<100) {
                    CustomTextView("rows \($0)")
                        .font(.title)
                }
            }
            .frame(maxWidth: .infinity)
        }
    }
}

#Preview {
    ScrollData()
}
