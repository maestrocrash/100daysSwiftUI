//
//  Project_11App.swift
//  Project_11
//
//  Created by MICHAIL SHAKHVOROSTOV on 02.10.2023.
//

import SwiftUI

@main
struct Project_11App: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            CreatingBook()
                .environment(\.managedObjectContext, dataController.containter.viewContext)
        }
    }
}
