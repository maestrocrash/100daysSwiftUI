//
//  PathVSShapes.swift
//  DrawProject
//
//  Created by MICHAIL SHAKHVOROSTOV on 22.09.2023.
//

import SwiftUI

struct Triangle: Shape {
    
    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        path.move(to: CGPoint(x: rect.midX, y: rect.minY))
        path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
        path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        path.closeSubpath()
        return path
    }
}

struct Arc: InsettableShape {
    let startAngle: Angle
    let endAngle: Angle
    let clockwise: Bool
    var insentAmount = 0.0
    
    func path(in rect: CGRect) -> Path {
        let rotationAdjustment = Angle.degrees(90)
        var path = Path()
        
        path.addArc(center: CGPoint(x: rect.midX, y: rect.midY),
                    radius: rect.width / 2 - insentAmount,
                    startAngle: startAngle - rotationAdjustment,
                    endAngle: endAngle - rotationAdjustment,
                    clockwise: !clockwise)
        return path
    }
    
    func inset(by amount: CGFloat) -> some InsettableShape {
        var arc = self
        
        arc.insentAmount += amount
        return arc
    }
}

struct PathVSShapes: View {
    var body: some View {
//        Triangle()
//            .fill(.pink)
//            .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//            .frame(width: 200, height: 200)
//        
//        Spacer()
//        
//        Arc(startAngle: .degrees(0), endAngle: .degrees(240), clockwise: true)
//            .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
//            .frame(width: 300, height: 300)
        
        Circle()
            .strokeBorder(.blue, lineWidth: 40)
        
        Arc(startAngle: .degrees(0), endAngle: .degrees(259), clockwise: true)
            .strokeBorder(.blue, lineWidth: 40)
        
    }
}

#Preview {
    PathVSShapes()
}
