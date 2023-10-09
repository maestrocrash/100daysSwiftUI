//
//  Ext+DateBlockView.swift
//  Bookworm2
//
//  Created by MICHAIL SHAKHVOROSTOV on 09.10.2023.
//

import Foundation

extension DateBlockView {
    
    func dateDiff(dateStart: Date, dateEnd: Date) -> DateComponents  {
        let diff = Calendar.current.dateComponents([.day], from: dateStart, to: dateEnd)
        return diff
    }
    
}
