//
//  ShipDataView.swift
//  Project_12
//
//  Created by MICHAIL SHAKHVOROSTOV on 10.10.2023.
//

import CoreData
import SwiftUI

struct ShipDataView: View {
    @Environment(\.managedObjectContext) var moc
    
    //выбирает параметры из значения массива
    //@FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "universe IN %@", ["Alliens", "Star Trek"])) var ships: FetchedResults<Ship>
    
    //имя начинает с буквы [c] пофиг на регистр
    //@FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "name BEGINSWITH[c] %@", "e")) var ships: FetchedResults<Ship>
    
    //имя начинается с любой буквы буквы кроме е
    @FetchRequest(sortDescriptors: [], predicate: NSPredicate(format: "NOT name BEGINSWITH[c] %@", "e")) var ships: FetchedResults<Ship>
    var body: some View {
        List(ships, id: \.self) {ship in
            Text(ship.name ?? "Unknown name")
        }
        
        Button("Add Examles") {
            let ship1 = Ship(context: moc)
            ship1.name = "Enterprise"
            ship1.universe = "Star Trek"
            
            let ship2 = Ship(context: moc)
            ship2.name = "Defiant"
            ship2.universe = "Star Trek"
            
            let ship3 = Ship(context: moc)
            ship3.name = "Millennium Falcom"
            ship3.universe = "Star Wars"
            
            let ship4 = Ship(context: moc)
            ship4.name = "Executor"
            ship4.universe = "Star Wars"
            
            try? moc.save()
        }
    }
}

