//
//  TextField.swift
//  WeSplit
//
//  Created by MICHAIL SHAKHVOROSTOV on 23.08.2023.
//

import SwiftUI


struct TextFieldViewSwift: View {
    
    //State - говорит что свойство можно изменять
    @State private var name: String = ""
    
    
    //$ - говорит о том что свойство нужно сохранять после ввода в TextField
    var body: some View {
        Form {
            TextField("Hello, enter to text", text: $name)
            Text("Hello \(name)")
        }
    }
}


#Preview {
    TextFieldViewSwift()
}
