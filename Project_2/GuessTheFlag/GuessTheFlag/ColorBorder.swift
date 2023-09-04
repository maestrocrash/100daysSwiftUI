//
//  ColorBorder.swift
//  GuessTheFlag
//
//  Created by MICHAIL SHAKHVOROSTOV on 28.08.2023.
//

import SwiftUI


struct ColorBorder: View {
    
    var body: some View {
        ZStack {
           // Color.mint
               // .frame(width: 200, height: 200)
                //.frame(minWidth: 200, maxWidth: .infinity, maxHeight: 200)
             
            VStack(spacing: 0) {
                Color.blue
                Color.green
            }
            
            Text("Hello, world!")
                .padding(50)
                .background(.ultraThinMaterial)
                .foregroundStyle(.secondary)
                
            
            
        }
        .ignoresSafeArea()
    }
    
}



#Preview {
    ColorBorder()
}
