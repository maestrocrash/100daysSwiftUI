//
//  ContentView.swift
//  WeSplit
//
//  Created by MICHAIL SHAKHVOROSTOV on 22.08.2023.
//

import SwiftUI

struct ContentView: View {
    @State private var playNotificationSounds = false
    
    var body: some View {
        NavigationStack {
            VStack {
                Form {
                    Image(systemName: "globe")
                        .imageScale(.large)
                        .foregroundStyle(.indigo)
                        .background(.cyan)
                    Text("Hello, world!")
                        .bold()
                        .italic()
                        .background(.green)
                    
                    Section {
                        Text("Hello, world!")
                        Text("Hello, world!")
                        Text("Hello, world!")
                        Text("Hello, world!")
                        Text("Hello, world!")
                    }
                    .bold()
                    .italic()
                    .font(.title3)
                }
                .padding()
                .foregroundStyle(.red)
                .background(.purple)
                
            }
            .padding()
            .background(.blue)
        }
        .navigationTitle("SwiftUI")
    }
}

#Preview {
    ContentView()
    
}
