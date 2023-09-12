//
//  ContentView.swift
//  project5
//
//  Created by MICHAIL SHAKHVOROSTOV on 11.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    let people = ["Rey", "Leia", "Luke", "Finn"]
    
    var body: some View {
        NavigationStack{
            List(people, id: \.self) {
                
                Text("\($0)")
                    .font(.title)
                
                Section("Static rows") {
                    Text("Static rows 1")
                    Text("Static rows 2")
                }
                
                Section("Dynamic rows") {
                    ForEach(0..<5) {
                        Text("Dynamic rows \($0)")
                    }
                }
                
                Section("Static rows ") {
                    Text("Static rows 3")
                    Text("Static rows 4")
                }
                
            }
            .navigationTitle("List swiftUI")
        }
        .listStyle(.grouped)
        
    }
}

#Preview {
    ContentView()
}
