//
//  DataController.swift
//  Bookworm
//
//  Created by MICHAIL SHAKHVOROSTOV on 02.10.2023.
//

import CoreData
import Foundation

class DataController: ObservableObject {
    
    let containter = NSPersistentContainer(name: "Bookworm")
    
    init() {
        containter.loadPersistentStores { description, error in
            if let error = error  {
                print("Core data error \(error.localizedDescription)")
            }
        }
    }
    
}
