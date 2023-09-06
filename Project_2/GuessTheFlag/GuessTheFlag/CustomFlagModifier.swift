//
//  CustomFlagModifier.swift
//  GuessTheFlag
//
//  Created by MICHAIL SHAKHVOROSTOV on 06.09.2023.
//

import SwiftUI


struct ImageFlag: ViewModifier {
    
    var nameImage: String
    
    func body(content: Content) -> some View {
    
        Image(nameImage)
            .renderingMode(.original)
            .clipShape(Capsule())
            .shadow(radius: 10)
    }
    
    
}

extension View {
    func imageFlag(name: String) -> some View {
        modifier(ImageFlag(nameImage: name))
    }
}
