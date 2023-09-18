//
//  ContentView.swift
//  challenge1
//
//  Created by MICHAIL SHAKHVOROSTOV on 14.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var arrayDigit = [1,2,3,4,5,6,7,8,9]

    var body: some View {
        var oneDigit = arrayDigit.randomElement()!
        var secondDigit = arrayDigit.randomElement()!
        
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("\(Image(systemName: "\(oneDigit).circle.fill")) * \(Image(systemName: "\(secondDigit).circle.fill")) =")
                .font(.largeTitle)
            
            Text("\(oneDigit * secondDigit)")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
