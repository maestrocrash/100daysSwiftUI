//
//  CustomTitleFont.swift
//  Project_7
//
//  Created by MICHAIL SHAKHVOROSTOV on 18.09.2023.
//

import SwiftUI

struct CustomTitleFont10: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
    }
}

struct CustomTitleFont100: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title)
    }
}

struct CustomTitleFont1000: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.title3)
    }
}


extension View {
    func title10() -> some View {
        modifier(CustomTitleFont10())
    }
    
    func title100() -> some View {
        modifier(CustomTitleFont100())
    }
    
    func title1000() -> some View {
        modifier(CustomTitleFont1000())
    }
}
