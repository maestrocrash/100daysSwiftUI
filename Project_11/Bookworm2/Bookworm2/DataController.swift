//
//  DataController.swift
//  Bookworm2
//
//  Created by MICHAIL SHAKHVOROSTOV on 03.10.2023.
//

import CoreData
import Foundation


class DataController: ObservableObject {
    
    let container = NSPersistentContainer(name: "Bookworm")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data error \(error.localizedDescription)")
            }
        }
    }
    
    
}
