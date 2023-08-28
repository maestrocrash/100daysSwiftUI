//
//  ForView.swift
//  WeSplit
//
//  Created by MICHAIL SHAKHVOROSTOV on 23.08.2023.
//

import SwiftUI


struct forView: View {
    
    let students = ["Harry", "Hermione", "Ron"]
    @State private var selectStudent = "Harry"
    
    var body: some View {
        NavigationStack {
            Form {
                Picker("Select your students", selection: $selectStudent) {
                    ForEach(students, id: \.self) {
                        Text($0)
                    }
                }
                
                Text("Chosen One -> \(selectStudent)")
//                ForEach(0..<100) {
//                    Text("Row in \($0)")
//                }
            }
            .navigationTitle("Row 100")
        }
            
    }
    
    
}


#Preview {
    forView()
}
