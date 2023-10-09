//
//  BookwormApp.swift
//  Bookworm
//
//  Created by MICHAIL SHAKHVOROSTOV on 02.10.2023.
//

import SwiftUI

@main
struct BookwormApp: App {
    @StateObject private var dataController = DataController()
    
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, dataController.containter.viewContext)
        }
    }
}
