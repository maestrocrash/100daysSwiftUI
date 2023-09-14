//
//  AnimationsGestureLetters.swift
//  Animations
//
//  Created by MICHAIL SHAKHVOROSTOV on 13.09.2023.
//

import SwiftUI


struct AnimationsGestureLetters: View {
    
    var letters = Array("Hello, SwiftUI")
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    
    
    var body: some View {
        HStack(spacing: 0) {
            ForEach(0..<letters.count) { num in
                Text(String(letters[num]))
                    .padding(5)
                    .font(.title)
                    .background(enabled ? .blue : .red)
                    .offset(dragAmount)
                    .animation(.default.delay(Double(num) / 40), value: dragAmount)
                
            }
        }
        .gesture(
            DragGesture()
                .onChanged{
                    dragAmount = $0.translation
                   
                }
                .onEnded {_ in 
                    dragAmount = .zero
                    enabled.toggle()
                }
        )
    }
}

#Preview {
    AnimationsGestureLetters()
}
