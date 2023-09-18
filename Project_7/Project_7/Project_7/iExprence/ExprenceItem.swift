//
//  ExprenceItem.swift
//  Project_7
//
//  Created by MICHAIL SHAKHVOROSTOV on 15.09.2023.
//

import Foundation


struct ExprenseItem: Identifiable, Codable {
    var id = UUID()
    let name: String
    let type: String
    let amount: Double
    let typeCurrency: String
    let imageType: String
}
