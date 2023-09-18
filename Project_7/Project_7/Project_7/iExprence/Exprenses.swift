//
//  Exprenses.swift
//  Project_7
//
//  Created by MICHAIL SHAKHVOROSTOV on 15.09.2023.
//

import Foundation


class Exprenses: ObservableObject {
    @Published var items = [ExprenseItem]() {
        didSet {
            let encoder = JSONEncoder()
            
            if let encoded = try? encoder.encode(items){
                UserDefaults.standard.setValue(encoded, forKey: "Items")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "Items") {
            if let decodeItems = try? JSONDecoder().decode([ExprenseItem].self, from: savedItems) {
                items = decodeItems
                return
            }
        }
        
        items = []
    }
}
