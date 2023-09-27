//
//  MetalViewDrawning.swift
//  DrawProject
//
//  Created by MICHAIL SHAKHVOROSTOV on 25.09.2023.
//

import SwiftUI

struct ColorCyclingCircle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) {value in
                
                Circle()
                    .inset(by: Double(value))
                    .strokeBorder(
                        LinearGradient(colors: [
                            color(for: value, brigtness: 1),
                            color(for: value, brigtness: 0.5)
                        ], startPoint: .top, endPoint: .bottom), lineWidth: 2)
                    
            }
        }
        .drawingGroup()
    }
    
    func color(for value: Int, brigtness: Double) -> Color {
        var targetHue = Double(value) / Double(steps) + amount
        
        if targetHue > 1 {
            targetHue -= 1
        }
        
        return Color(hue: targetHue, saturation: 1, brightness: brigtness)
    }
}

struct MetalViewDrawning: View {
    @State private var colorCycle = 0.0
    
    var body: some View {
        ColorCyclingCircle(amount: colorCycle)
            .frame(width: 300, height: 300)
        
        Text("Slider color")
        Slider(value: $colorCycle)
            .padding(.horizontal)
    }
}

#Preview {
    MetalViewDrawning()
}
