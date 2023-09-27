//
//  AnimatingSimple.swift
//  DrawProject
//
//  Created by MICHAIL SHAKHVOROSTOV on 25.09.2023.
//

import SwiftUI

struct Trapezoid: Shape {
    var insetAmount: Double
    
    var animatableData: Double {
        get {insetAmount}
        set {insetAmount = newValue}
    }
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: 0, y: rect.maxY))
        path.addLine(to: CGPoint(x: insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX - insetAmount, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: 0, y: rect.maxY))
        
        return path
    }
    
}

struct AnimatingSimple: View {
    @State private var insetAmount = 50.0
    @State private var colorTrap = Color.blue
    
    var body: some View {
        Trapezoid(insetAmount: insetAmount)
            .frame(width: 200, height: 200)
            .foregroundStyle(colorTrap)
            .onTapGesture {
                withAnimation {
                    insetAmount = Double.random(in: 10...90)
                    colorTrap = Color(red: Double.random(in: 0...1), green: Double.random(in: 0...1), blue: Double.random(in: 0...1))
                }
            }
        
    }
}

#Preview {
    AnimatingSimple()
}
