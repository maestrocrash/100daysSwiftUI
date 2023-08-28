//
//  NavView.swift
//  WeSplit
//
//  Created by MICHAIL SHAKHVOROSTOV on 23.08.2023.
//

import SwiftUI


struct NavViewSwiftUI: View {
    
    var body: some View {
        NavigationStack {
            Form {
                Section {
                    Text("Hello world")
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
        }
    }

}

#Preview {
    NavViewSwiftUI()
}
