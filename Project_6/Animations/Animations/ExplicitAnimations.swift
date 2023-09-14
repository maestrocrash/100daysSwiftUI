//
//  ExplicitAnimations.swift
//  Animations
//
//  Created by MICHAIL SHAKHVOROSTOV on 13.09.2023.
//

import SwiftUI

struct ExplicitAnimations: View {
    
    @State private var animationAmount = 0.0
    
    var body: some View{
        Button("Tap Me") {
            withAnimation(.interpolatingSpring(stiffness: 3, damping: 1)) {
                animationAmount -= 360
            }
           
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(Circle())
        .rotation3DEffect(
            .degrees(animationAmount),
            axis: (x: 1.0, y: 0.0, z: 0.0))
        
    }
}


#Preview {
    ExplicitAnimations()
}
