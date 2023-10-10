//
//  DataController.swift
//  Project_12
//
//  Created by MICHAIL SHAKHVOROSTOV on 09.10.2023.
//

import CoreData
import Foundation


class DataController: ObservableObject {
    let container = NSPersistentContainer(name: "SingerModel")
    
    init() {
        container.loadPersistentStores { description, error in
            if let error = error {
                print("Core data erroe \(error.localizedDescription)")
                return
            }
            
            self.container.viewContext.mergePolicy = NSMergePolicy.mergeByPropertyObjectTrump
        }
    }
}
