//
//  customTitleBlueLarge.swift
//  project3
//
//  Created by MICHAIL SHAKHVOROSTOV on 06.09.2023.
//

import SwiftUI

struct TitleLarge: ViewModifier {
    
    func body(content: Content) -> some View {
        content
            .font(.system(size: 54, weight: .light, design: .monospaced))
            .foregroundStyle(.blue)
            .padding()
    
    }
    
}

extension View {
    func titleLargeBlue() -> some View{
        modifier(TitleLarge())
    }
}
