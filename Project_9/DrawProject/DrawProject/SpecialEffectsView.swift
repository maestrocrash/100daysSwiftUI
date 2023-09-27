//
//  SpecialEffectsView.swift
//  DrawProject
//
//  Created by MICHAIL SHAKHVOROSTOV on 25.09.2023.
//

import SwiftUI

struct SpecialEffectsView: View {
    
    @State private var amount = 0.0
    
    
    var body: some View {
        VStack {
            Image("ExampleCar")
                .resizable()
                .scaledToFit()
                .frame(width: 300, height: 300)
                .saturation(amount)
                .blur(radius: (1-amount) * 20)
            
//            Rectangle()
//                .fill(.blue)
//                .blendMode(.multiply)
            
            Text("\(amount, format: .number.precision(.fractionLength(2)))")
                .foregroundStyle(.white)
            Button("Tap me") {
                if amount == 1 {
                    amount = 0
                } else {
                    amount = 1
                }
            }
            .buttonStyle(.borderedProminent)
            
            
            
            Slider(value: $amount)
                .padding()
        }
        
//        VStack {
//            ZStack {
//                Circle()
//                    .fill(Color(red: 1, green: 0, blue: 0))
//                    .frame(width: 200 * amount)
//                    .offset(x: -50, y: -80)
//                    .blendMode(.screen)
//                
//                Circle()
//                    .fill(Color(red: 0, green: 1, blue: 0))
//                    .frame(width: 200 * amount)
//                    .offset(x: 50, y: -80)
//                    .blendMode(.screen)
//                
//                Circle()
//                    .fill(Color(red: 0, green: 0, blue: 1))
//                    .frame(width: 200 * amount)
//                    .blendMode(.screen)
//                
//            }
//            .frame(width: 300, height: 300)
//            
//            Slider(value: $amount)
//                .padding()
//        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(.black)
        .ignoresSafeArea()
    }
}

#Preview {
    SpecialEffectsView()
}
