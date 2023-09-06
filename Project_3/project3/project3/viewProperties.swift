//
//  viewProperties.swift
//  project3
//
//  Created by MICHAIL SHAKHVOROSTOV on 06.09.2023.
//

import SwiftUI



struct viewProperties: View {
    
    var text1: some View {
        Text("text1")
            .titleLargeBlue()
    }
    
    var text2 = Text("Text2").foregroundStyle(.red)
    
    var spells: some View {
        HStack {
            Text("Lumos")
                .modifier(Title())
            Text("Obliviate")
                .titleStyle()
        }
        .foregroundStyle(.green)
        
    }
    
    //предпочтительное использование
    @ViewBuilder var speels2: some View {
        Text("Lumos")
    }
    
    var body: some View {
        text1
        text2
        spells
        speels2
            
    }
}


#Preview {
    viewProperties()
}
