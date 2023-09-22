//
//  CodableData.swift
//  Project_8
//
//  Created by MICHAIL SHAKHVOROSTOV on 19.09.2023.
//

import SwiftUI

struct User: Codable {
    let name: String
    let address: Address
}

struct Address: Codable {
    var street: String
    var city: String
}

struct CodableData: View {
    var body: some View {
        Button("JSON Decode") {
            let input = """
    {
        "name": "Steve Jobs"
        "address": {
            "street" : "555, Ostrovskogo avenue",
            "city" : "California"
        }
    }
"""
            
            let data = Data(input.utf8)
            
            if let user = try? JSONDecoder().decode(User.self, from: data) {
                print(user.address.city)
            }
        }
    }
}

#Preview {
    CodableData()
}
