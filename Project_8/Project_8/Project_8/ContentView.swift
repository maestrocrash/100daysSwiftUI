//
//  ContentView.swift
//  Project_8
//
//  Created by MICHAIL SHAKHVOROSTOV on 18.09.2023.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        GeometryReader {geo in
            Image("Example")
                 .resizable()
                 .scaledToFit()
                 //.scaledToFill()
                 .frame(width: geo.size.width * 0.6)
                 .frame(width: geo.size.width, height: geo.size.height)
                 //.clipped()
        }
    }
}

#Preview {
    ContentView()
}
