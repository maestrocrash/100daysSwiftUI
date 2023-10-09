//
//  ContentView.swift
//  Project_11
//
//  Created by MICHAIL SHAKHVOROSTOV on 02.10.2023.
//

import SwiftUI

struct PushButton: View {
    let title: String
    @Binding var isOn: Bool
    
    var onColor:[Color] = [.red, .blue, .yellow]
    var offColors: [Color] = [Color(white: 0.6), Color(white: 0.4)]
    
    var body: some View {
        Button(title) {
            isOn.toggle()
        }
        .padding()
        .background(
            LinearGradient(colors: isOn ? onColor : offColors, startPoint: .top, endPoint: .bottom)
        )
        .foregroundStyle(.white)
        .clipShape(Capsule())
        .shadow(radius: isOn ? 0 : 5)
    }
}

struct ContentView: View {
    @State private var isRememberMe = false
    
    var body: some View {
        VStack {
            PushButton(title: "Remember me", isOn: $isRememberMe)
            
            Text(isRememberMe ? "On" : "Off")
            
            
            Toggle("Remember me", isOn: $isRememberMe)
                .foregroundStyle(.blue)
                .toolbarColorScheme(.light, for: .bottomBar)
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
