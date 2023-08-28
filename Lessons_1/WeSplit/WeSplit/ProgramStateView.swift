//
//  SwiftUIView.swift
//  WeSplit
//
//  Created by MICHAIL SHAKHVOROSTOV on 23.08.2023.
//

import SwiftUI

struct ProgramStateView: View {
    
    //@State хранит свойство и позволяет его менять даже в структуре
   @State private var tapCount = 0 //apple советует использовать private
    
    var body: some View {
        
        Button("Tap count \(tapCount)") {
            self.tapCount += 1
        }
   
    }
}

#Preview {
    ProgramStateView()
}
