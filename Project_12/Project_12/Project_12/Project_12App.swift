//
//  Project_12App.swift
//  Project_12
//
//  Created by MICHAIL SHAKHVOROSTOV on 09.10.2023.
//

import SwiftUI

@main
struct Project_12App: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            SingerView()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
