//
//  capsuleText.swift
//  project3
//
//  Created by MICHAIL SHAKHVOROSTOV on 06.09.2023.
//

import SwiftUI


struct CapsuleText: View {
    
    var text: String
    var colorText: Color
    
    var body: some View {
        Text(text)
            .font(.largeTitle)
            .foregroundStyle(colorText)
            .padding()
            .background(.blue)
            .clipShape(Capsule())
    }
}
