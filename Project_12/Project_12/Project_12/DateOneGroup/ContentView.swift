//
//  ContentView.swift
//  Project_12
//
//  Created by MICHAIL SHAKHVOROSTOV on 09.10.2023.
//

import SwiftUI

struct Student: Hashable {
    let name:String
}

struct ContentView: View {
    
    let students = [Student(name: "Harry Potter"), Student(name: "Hermione Granger")]
    
    var body: some View {
        VStack {
            List {
                ForEach(students, id: \.self) {
                    Text("\($0.name)")
                }
            }
        }
    }
}

#Preview {
    ContentView()
}
