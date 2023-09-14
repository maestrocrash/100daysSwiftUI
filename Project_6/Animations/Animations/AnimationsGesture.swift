//
//  AnimationsGesture.swift
//  Animations
//
//  Created by MICHAIL SHAKHVOROSTOV on 13.09.2023.
//

import SwiftUI


struct AnimationsGesture: View {
    @State private var dragAmount = CGSize.zero
    
    var body: some View {
        LinearGradient(gradient: Gradient(colors: [.green, .red]), startPoint: .topLeading, endPoint: .bottomTrailing)
            .frame(width: 300, height: 200)
            .clipShape(RoundedRectangle(cornerRadius: 10))
            .offset(dragAmount)
            .gesture(
                DragGesture()
                    .onChanged {dragAmount = $0.translation}
                    .onEnded { _ in 
                        withAnimation {
                            dragAmount = CGSize.zero
                        }
                    }
            )
          // .animation(.spring(), value: dragAmount)
    }
}

#Preview {
    AnimationsGesture()
}
