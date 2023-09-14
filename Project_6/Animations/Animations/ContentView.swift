//
//  ContentView.swift
//  Animations
//
//  Created by MICHAIL SHAKHVOROSTOV on 12.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap me") {
            //animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundStyle(.white)
        .clipShape(Circle())
        .overlay(
            Circle()
                .stroke(.red)
                .scaleEffect(animationAmount)
                .opacity(2 - animationAmount)
                .animation(
                    .easeOut(duration:0.5)
                  //  .delay(1),
                      //  .repeatCount(3, autoreverses: true),
                        .repeatForever(autoreverses: true),
                    value: animationAmount
                )
        )
        .onAppear {
            animationAmount = 2
        }
      //  .scaleEffect(animationAmount)
        //.blur(radius: (animationAmount - 1) * 3)
       // .animation(.interpolatingSpring(stiffness: 50, damping: 0.2), value: animationAmount)
//        .animation(
//            .easeOut(duration:0.5),
//          //  .delay(1),
//              //  .repeatCount(3, autoreverses: true),
//                //.repeatForever(autoreverses: true),
//            value: animationAmount
//        )
    }
}

#Preview {
    ContentView()
}
