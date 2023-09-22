//
//  Astranaut.swift
//  Moonshot
//
//  Created by MICHAIL SHAKHVOROSTOV on 20.09.2023.
//

import Foundation

struct Astronaut: Codable, Identifiable {
    var id: String
    var name: String
    var description: String
}

struct CrewMember {
    let role: String
    let astronaut: Astronaut
}
