//
//  ArrowView.swift
//  DrawProject
//
//  Created by MICHAIL SHAKHVOROSTOV on 26.09.2023.
//

import SwiftUI

struct ArrowShape: Shape {
    func path(in rect: CGRect) -> Path {
        var path = Path()
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        
        
        path.closeSubpath()
        return path
    }
}

struct ColorCyclingRectangle: View {
    var amount = 0.0
    var steps = 100
    
    var body: some View {
        ZStack {
            ForEach(0..<steps) {value in
                
                Rectangle()
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

struct ArrowView: View {
    
    @State private var widthlineArrow: CGFloat = 10
    @State private var colorRectangle = 0.0
    
    var body: some View {
//        Group {
//            ArrowShape()
//                .fill(.blue)
//                .stroke(.pink, style: StrokeStyle(lineWidth: widthlineArrow, lineCap: .round, lineJoin: .round))
//                .frame(width: 300, height: 300)
//            
//            
//            Rectangle()
//                .fill(.blue)
//                .stroke(.pink, style: StrokeStyle(lineWidth: widthlineArrow, lineCap: .round, lineJoin: .round))
//                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 300)
//            
//        }
//        
//        Slider(value: $widthlineArrow, in: 5...50)
//            .padding([.horizontal, .top])
        
        ColorCyclingRectangle(amount: colorRectangle)
            .frame(width: 300, height: 200)
        
        Text("Slider color")
        Slider(value: $colorRectangle)
            .padding(.horizontal)
        
        
    }
    
}

#Preview {
    ArrowView()
}
