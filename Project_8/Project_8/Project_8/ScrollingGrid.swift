//
//  ScrollingGrid.swift
//  Project_8
//
//  Created by MICHAIL SHAKHVOROSTOV on 19.09.2023.
//

import SwiftUI

struct ScrollingGrid: View {
    
    let layout = [
        GridItem(.adaptive(minimum: 80)),
//        GridItem(.fixed(80)),
//        GridItem(.fixed(80))
    ]
    
    var body: some View {
        ScrollView(.horizontal) {
            LazyHGrid(rows: layout){
                ForEach(0..<1000) {
                    Text("Items \($0)")
                }
            }
        }
    }
}

#Preview {
    ScrollingGrid()
}
