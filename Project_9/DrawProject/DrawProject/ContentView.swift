//
//  ContentView.swift
//  DrawProject
//
//  Created by MICHAIL SHAKHVOROSTOV on 22.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
            Path {path in
                path.move(to: CGPoint(x: 200, y: 100))
                path.addLine(to: CGPoint(x: 100, y: 300))
                path.addLine(to: CGPoint(x: 300, y: 300))
              //  path.addLine(to: CGPoint(x: 200, y: 100))
                path.closeSubpath()
            }
            .fill(.pink)
           // .stroke(.blue, lineWidth: 10)
            
            .stroke(.blue, style: StrokeStyle(lineWidth: 10, lineCap: .round, lineJoin: .round))
        }
    }
}

#Preview {
    ContentView()
}
