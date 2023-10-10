//
//  FilteredList.swift
//  Project_12
//
//  Created by MICHAIL SHAKHVOROSTOV on 10.10.2023.
//

import CoreData
import SwiftUI

struct FilteredList<T: NSManagedObject, Content: View>: View {
    
    enum predictEnum: String {
        case beginsWith = "%K BEGINSWITH %@"
    }
    
    @FetchRequest var fetchRequest: FetchedResults<T>
    let content: (T) -> Content
    
    var body: some View {
        List(fetchRequest, id: \.self) {item in
            self.content(item)
        }
    }
    
    
    init(filter: String, filterValue: String, predicat: predictEnum, content: @escaping (T) -> Content) {
        _fetchRequest = FetchRequest<T>(sortDescriptors: [], predicate: NSPredicate(format: predicat.rawValue, filter, filterValue))
        self.content = content
    }
}
