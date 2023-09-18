//
//  DeleteItems.swift
//  Project_7
//
//  Created by MICHAIL SHAKHVOROSTOV on 15.09.2023.
//

import SwiftUI

struct DeleteItems: View {
    
    @State private var arrayNumber = [Int]()
    @State private var currentNumber = 1
    
    
    var body: some View {
        NavigationStack{
            VStack {
                List {
                    ForEach(arrayNumber, id: \.self) {
                        Text("Row \($0)")
                    }
                    .onDelete(perform: removeRows)
                }
                
                
                Button("Add numbers") {
                    arrayNumber.append(currentNumber)
                    currentNumber += 1
                }
            }
            .navigationTitle("Delete rows")
            //.toolbar(removing: .sidebarToggle)
            .toolbar {
                EditButton()
            }
        }
        
    }
}

extension DeleteItems {
    func removeRows(at offsets: IndexSet) {
        arrayNumber.remove(atOffsets: offsets)
    }
}


//#Preview {
//    DeleteItems()
//}

