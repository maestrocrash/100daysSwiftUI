//
//  MultiLineTextField.swift
//  Project_11
//
//  Created by MICHAIL SHAKHVOROSTOV on 02.10.2023.
//

import SwiftUI

struct MultiLineTextField: View {
    @AppStorage("notes") private var notes = ""
    
    
    var body: some View {
        NavigationStack {
            TextEditor(text: $notes)
                .navigationTitle("Notes")
                .padding()
        }
    }
}

#Preview {
    MultiLineTextField()
}
