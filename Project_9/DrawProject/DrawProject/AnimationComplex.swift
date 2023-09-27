//
//  AnimationComplex.swift
//  DrawProject
//
//  Created by MICHAIL SHAKHVOROSTOV on 25.09.2023.
//

import SwiftUI

struct Checkboard: Shape {
    var rows: Int
    var colums: Int
    
    var animatableData: AnimatablePair<Double, Double> {
        get {
            AnimatablePair(Double(rows), Double(colums))
        }
        
        set {
            rows = Int(newValue.first)
            colums = Int(newValue.second)
        }
    }
    
    

    func path(in rect: CGRect) -> Path {
        var path = Path()
        
        let rowSize = rect.height / Double(rows)
        let columnSize = rect.width / Double(colums)
        
        for row in 0..<rows {
            for column in 0..<colums {
                if (row + column).isMultiple(of: 2) {
                    let startX = columnSize * Double(column)
                    let startY = rowSize * Double(row)
                    
                    let rect = CGRect(x: startX, y: startY, width: columnSize, height: rowSize)
                    path.addRect(rect)
                }
            }
        }
        
        return path
    }
}

struct AnimationComplex: View {
    @State private var rows = 4
    @State private  var column = 4
    
    var body: some View {
        Checkboard(rows: rows, colums: column)
            .onTapGesture {
                withAnimation(.linear(duration: 3)) {
                    rows = 8
                    column = 16
                }
            }
            .ignoresSafeArea()
    }
}

#Preview {
    AnimationComplex()
}
