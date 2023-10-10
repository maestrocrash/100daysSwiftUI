//
//  SingerView.swift
//  Project_12
//
//  Created by MICHAIL SHAKHVOROSTOV on 10.10.2023.
//

import CoreData
import SwiftUI

struct SingerView: View {
    
    @Environment(\.managedObjectContext) var moc
    @State private var lastNameFilter = "A"
    
    var body: some View {
        VStack {
            
            FilteredList(filter: "lastName", filterValue: lastNameFilter, predicat: .beginsWith) {(singer: Singer) in
                Text("\(singer.wrappedFirstName) - \(singer.wrappedLastName)")
            }
            
            Button("Add Exaples") {
                let taylor = Singer(context: moc)
                taylor.firstName = "Taylor"
                taylor.lastName = "Swift"
                
                let ed = Singer(context: moc)
                ed.firstName = "Ed"
                ed.lastName = "Sheeran"
                
                let adele = Singer(context: moc)
                adele.firstName = "Adele"
                adele.lastName = "Adkins"
                
                try? moc.save()
            }
            
            HStack {
                Button("Show A") {
                    lastNameFilter = "A"
                }
                
                Button("Show S") {
                    lastNameFilter = "S"
                }
            }
            .buttonStyle(.borderedProminent)
        }
    }
}

#Preview {
    SingerView()
}
