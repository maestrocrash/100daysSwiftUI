//
//  WizardData.swift
//  Project_12
//
//  Created by MICHAIL SHAKHVOROSTOV on 10.10.2023.
//

import SwiftUI

struct WizardData: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var wizard: FetchedResults<Wizard>
    
    var body: some View {
        VStack {
            List(wizard, id: \.self) {wizard in
                Text(wizard.name ?? "Unknown")
            }
            
            Button("Add") {
                let wizard = Wizard(context: moc)
                wizard.name = "Harry Potter"
            }
            
            Button("Save") {
                do {
                    try moc.save()
                } catch {
                    print(error.localizedDescription)
                }
            }
        }
    }
}

#Preview {
    WizardData()
}
