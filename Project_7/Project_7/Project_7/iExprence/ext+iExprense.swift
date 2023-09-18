//
//  ext+iExprense.swift
//  Project_7
//
//  Created by MICHAIL SHAKHVOROSTOV on 15.09.2023.
//

import Foundation


extension iExprense {
    func removeItem(at offset: IndexSet) {
        exprenses.items.remove(atOffsets: offset)
    }
}
