//
//  Bookworm2App.swift
//  Bookworm2
//
//  Created by MICHAIL SHAKHVOROSTOV on 03.10.2023.
//

import SwiftUI

@main
struct Bookworm2App: App {
    
    @StateObject private var dataController = DataController()

    var body: some Scene {
        WindowGroup {
            CreatingBook()
                .environment(\.managedObjectContext, dataController.container.viewContext)
        }
    }
}
