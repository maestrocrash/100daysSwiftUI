//
//  ContentView.swift
//  Project_7
//
//  Created by MICHAIL SHAKHVOROSTOV on 14.09.2023.
//

import SwiftUI


class User: ObservableObject {
    @Published var firstName = "Bilbo"
    @Published var lastName = "Baggins"
}

struct ContentView: View {
    
    // @ObservedObject для классов если нужно передавать данные между view
    
    //для классов но не нужно по разным view передавать данные
    @StateObject private var user = User()
    
    var body: some View {
        VStack {
            Text("My name \(user.firstName) \(user.lastName)")
            
            TextField("Your name", text: $user.firstName)
            TextField("Your last name", text: $user.lastName)
        }
        .padding()
    }
}

//#Preview {
//    ContentView()
//}	
