//
//  testPicker.swift
//  Project_7
//
//  Created by MICHAIL SHAKHVOROSTOV on 18.09.2023.
//

import SwiftUI

struct testPicker: View {
    
    @State private var typeCurrency = "USD"
    @State private var amount = 0.0
    
    var typesCurrency = ["EUR", "USD", "RUB"]
    
    var body: some View {
        
        
        Picker("Currency", selection: $typeCurrency) {
            ForEach(typesCurrency, id: \.self) {
                Text($0)
            }
        }
        
        TextField("Amount", value: $amount, format: .currency(code: typeCurrency))
            .keyboardType(.decimalPad)
        
        Text("\(amount)")
        
        Button("Tap me") {
            
        }
    }
}

#Preview {
    testPicker()
}
