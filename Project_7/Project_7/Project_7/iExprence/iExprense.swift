//
//  iExprense.swift
//  Project_7
//
//  Created by MICHAIL SHAKHVOROSTOV on 15.09.2023.
//

import SwiftUI

struct iExprense: View {
    
    @StateObject var exprenses = Exprenses()
    @State private var showningAddEprense = false
 
    var body: some View {
        NavigationStack {
            
            List {
                ForEach(exprenses.items) {item in
                    HStack {
                        Image(systemName: item.imageType)
                            .font(.largeTitle)
                        
                        VStack(alignment: .leading) {
                            Text("\(item.name)")
                                .font(.headline)
                            Text("\(item.type)")
                                
                        }
                        Spacer()
                        
                        
                        if item.amount <= 10 {
                            Text(item.amount, format: .currency(code: item.typeCurrency))
                                .title10()
                        } else if item.amount <= 100 {
                            Text(item.amount, format: .currency(code: item.typeCurrency))
                                .title100()
                        } else {
                            Text(item.amount, format: .currency(code: item.typeCurrency))
                                .title1000()
                        }
                        
                        
                    }
                }
                .onDelete(perform: removeItem)
            }
            .navigationTitle("iExprenses")
            .toolbar {
                Button {
                    showningAddEprense = true
//                    let exprense = ExprenseItem(name: "Test", type: "test", amount: 4)
//                    exprenses.items.append(exprense)
                } label: {
                    Image(systemName: "plus")
                }
            }
            .sheet(isPresented: $showningAddEprense, content: {
                AddView(expense: exprenses)
            })
        }
    }
}


#Preview {
    iExprense()
}
