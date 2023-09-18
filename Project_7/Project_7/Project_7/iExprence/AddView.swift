//
//  AddView.swift
//  Project_7
//
//  Created by MICHAIL SHAKHVOROSTOV on 16.09.2023.
//

import SwiftUI

struct AddView: View {
    
    @ObservedObject var expense: Exprenses
    @Environment(\.dismiss) var dismiss
    
    @State private var name = ""
    @State private var type = "Personal"
    @State private var typeCurrency = "USD"
    @State private var amount = 0.0
    @State var imageType = ""
    
    let types = ["Busines", "Personal"]
    let typesCurrency = ["USD", "EUR", "RUB"]
   
    
    var body: some View {
        NavigationStack {
            Form {
                TextField("Name", text: $name)
                
                
                Picker("Type", selection: $type) {
                    ForEach(types, id: \.self) {
                        Text($0)
                    }
                }
                
                Picker("Currency", selection: $typeCurrency) {
                    ForEach(typesCurrency, id: \.self) {
                        Text($0)
                    }
                }
                
                TextField("Amount", value: $amount, format: .currency(code: typeCurrency))
                    .keyboardType(.decimalPad)
            }
            .navigationTitle("Add new expense")
            .toolbar(content: {
                Button("Save") {
                    
                    guard name != "" else {
                        print("Error")
                        return
                    }
                    
                    if type == "Personal" {
                        imageType = "person.crop.square"
                    } else if type == "Busines" {
                        imageType = "case.fill"
                    }
                    
                    let item = ExprenseItem(name: name, type: type, amount: amount, typeCurrency: typeCurrency, imageType: imageType)
                    print(amount)
                    expense.items.append(item)
                    print(item)
                    dismiss()
                
                }
            })
        }
    }
}


#Preview {
    AddView(expense: Exprenses())
}
