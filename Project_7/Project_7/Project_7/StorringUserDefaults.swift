//
//  StorringUserDefaults.swift
//  Project_7
//
//  Created by MICHAIL SHAKHVOROSTOV on 15.09.2023.
//

import SwiftUI


struct StorringUserDefaults: View {
    /*
     @AppStorage отлично подходит для хранения простых настроек, таких как целые числа и логические значения, но когда дело доходит до сложных данных – например, пользовательских типов Swift – нам нужно немного больше поработать. */
   // @State private var tapCount = UserDefaults.standard.integer(forKey: "Tap")
    
    @AppStorage("tapCount") private var tapCount = 0
    
    var body: some View {
        Button("Tap me") {
            tapCount += 1
            
           // UserDefaults.standard.set(tapCount, forKey: "Tap")
        }
        Text("\(tapCount)")
    }
}

//#Preview {
//    StorringUserDefaults()
//}
