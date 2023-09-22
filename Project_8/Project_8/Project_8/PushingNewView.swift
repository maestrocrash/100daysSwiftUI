//
//  PushingNewView.swift
//  Project_8
//
//  Created by MICHAIL SHAKHVOROSTOV on 19.09.2023.
//

import SwiftUI

struct PushingNewView: View {
    var body: some View {
        NavigationStack {
            
            List(0..<100) {row in
                NavigationLink {
                    Text("Detail view \(row)")
                } label: {
                    Text("Rows \(row)")
                       // .padding()
                }
            }
   
            .navigationTitle("SwiftUI")
        }
    }
}

#Preview {
    PushingNewView()
}
