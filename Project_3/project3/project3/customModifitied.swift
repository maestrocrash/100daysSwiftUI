//
//  cusomModifitied.swift
//  project3
//
//  Created by MICHAIL SHAKHVOROSTOV on 06.09.2023.
//

import SwiftUI

struct Title: ViewModifier {
    func body(content: Content) -> some View {
        content
            .font(.largeTitle)
            .foregroundStyle(.white)
            .padding()
            .background(.blue)
            .clipShape(RoundedRectangle(cornerRadius: 10))
    }
}

struct WaterMark: ViewModifier {
    var text: String
    
    func body(content: Content) -> some View {
        ZStack(alignment: .bottomTrailing) {
            content
            
            Text(text)
                .font(.caption)
                .foregroundStyle(.white)
                .padding(5)
                .background(.black)
        }
    }
}

struct customModifier: View {
    
    var body: some View {
        Text("Text")
            .titleStyle()
        
        Color.blue
            .frame(width: 200, height: 200)
            .waterMark(text: "Hacking with swift")
    }
    
}


extension View {
    func titleStyle() -> some View {
        modifier(Title())
    }
    
    func waterMark(text: String) -> some View {
        modifier(WaterMark(text: text))
    }
}

#Preview {
    customModifier()
}
