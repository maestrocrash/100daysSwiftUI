//
//  ArchiveObjects.swift
//  Project_7
//
//  Created by MICHAIL SHAKHVOROSTOV on 15.09.2023.
//

import SwiftUI

struct Users: Codable {
    let name: String
    let lastName: String
}

struct ArchiveObjects: View {
    
    @State private var user = Users(name: "Taylor", lastName: "Swift")
    
    var body: some View {
        Button("Save users") {
            let encoder = JSONEncoder()
            
            if let data = try? encoder.encode(user) {
                UserDefaults.standard.setValue(data, forKey: "userData")
            }
        }
    }
}

#Preview {
    ArchiveObjects()
}
