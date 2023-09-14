//
//  AnimationStack.swift
//  Animations
//
//  Created by MICHAIL SHAKHVOROSTOV on 13.09.2023.
//

import SwiftUI

struct AnimationStack: View {

    @State private var enabled = false

    var body: some View {
        Button("Tap me") {
            enabled.toggle()
        }
        .frame(width: 200, height: 200)
        .background(enabled ? .blue : .red)
        .animation(nil, value: enabled)
        .foregroundStyle(.white)
        
        .clipShape(RoundedRectangle(cornerRadius: enabled ? 60 : 0))
        .animation(.interpolatingSpring(stiffness: 10, damping: 1), value: enabled)
    }
}


#Preview {
    AnimationStack()
}
