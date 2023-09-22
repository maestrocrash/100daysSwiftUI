//
//  ContentView.swift
//  Moonshot
//
//  Created by MICHAIL SHAKHVOROSTOV on 20.09.2023.
//

import SwiftUI

struct ContentView: View {
    
    let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State public var listOrTable = false
    
    var body: some View {
        NavigationStack {
            
            if listOrTable == false {
                ListStyleView()
                    .toolbar {
                        Button {
                            listOrTable.toggle()
                        } label: {
                            Image(systemName: "square.grid.2x2")
                                .foregroundStyle(.white)
                        }
                    }
                    
            } else {
                IconStyleView()
                    .toolbar {
                        Button {
                            listOrTable.toggle()
                        } label: {
                            Image(systemName: "list.bullet")
                                .foregroundStyle(.white)
                        }
                    }
            }
        }
        .preferredColorScheme(.dark)
    }
}

#Preview {
    ContentView()
}
