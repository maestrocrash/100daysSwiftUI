//
//  ContentView.swift
//  GuessTheFlag
//
//  Created by MICHAIL SHAKHVOROSTOV on 28.08.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        
        //VStack(alignment: .leading //выравнивание содержание стека
        
//        HStack(spacing: 20) {
//
//        }
        
//        VStack(spacing: 20) {
//            Spacer()
//            Image(systemName: "globe")
//                .imageScale(.large)
//                .foregroundStyle(.tint)
//            Text("Hello, world!")
//            Text("Hello, world!")
//            Spacer()
//            Spacer()
//        }
//        .padding()
//        
//        ZStack {
//            Text("test1")
//            Text("Test2")
//        }
        
        
        VStack(spacing: 20) {
            HStack(spacing: 20) {
                Text("1")
                Text("2")
                Text("3")
            }
            HStack(spacing: 20) {
                Text("4")
                Text("5")
                Text("6")
            }
            HStack(spacing: 20) {
                Text("7")
                Text("8")
                Text("9")
            }
        }
    }
}

#Preview {
    ContentView()
}
