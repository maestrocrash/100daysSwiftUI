//
//  viewComposition.swift
//  project3
//
//  Created by MICHAIL SHAKHVOROSTOV on 06.09.2023.
//

import SwiftUI


struct viewComposition: View {
    var body: some View {
        VStack(spacing: 10) {
            CapsuleText(text: "First message", colorText: .white)
            
            CapsuleText(text: "Second message", colorText: .yellow)
        }
    }
}

 
#Preview {
    viewComposition()
}
