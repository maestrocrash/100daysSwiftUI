//
//  customContainers.swift
//  project3
//
//  Created by MICHAIL SHAKHVOROSTOV on 06.09.2023.
//

import SwiftUI

struct GridStack<Content: View>: View {
    
    let rows: Int
    let colums: Int
    @ViewBuilder  let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<colums, id: \.self) { colum in
                        content(row, colum)
                    }
                    .border(.yellow)
                 //   .padding()
                }

            }
            .border(.blue)
           // .padding()
        }
        
    }
}


struct CustomContainer: View {
    
    var body: some View {
        GridStack(rows: 4, colums: 4) { row, col in
            //HStack {
                Image(systemName: "\(row * 4 + col).circle")
                Text("row \(row) col \(col)")
            //}
        }
        //.border(.blue)
    }
    
}


#Preview {
    CustomContainer()
}
