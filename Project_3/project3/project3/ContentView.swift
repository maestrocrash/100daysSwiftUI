//
//  ContentView.swift
//  project3
//
//  Created by MICHAIL SHAKHVOROSTOV on 05.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var stateForeground = false
    
    var body: some View {
//        Button("Hello world") {
//            stateForeground.toggle()
//            
//            print(type(of: self.body))
//        }
//        .foregroundColor( stateForeground ? .cyan : .red)
//        .background(.green)
//        .padding(20)
//        .background(.blue)
//        .padding(30)
//        .background(.yellow)
        
        
        VStack {
            Text("Gryffindor")
                .font(.largeTitle )
            Text("Hufflepuff")
            Text("Ravenclaw")
            Text("Slytherin")
        }
        .font(.title)
        .blur(radius: 1)
    }
}

#Preview {
    ContentView()
}
