//
//  SaveData.swift
//  Project_12
//
//  Created by MICHAIL SHAKHVOROSTOV on 10.10.2023.
//

import SwiftUI

struct SaveData: View {
    
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Button("Save") {
            //проверка на изменения
            if moc.hasChanges {
                try? moc.save()
            }
        }
    }
}

#Preview {
    SaveData()
}
