//
//  ShowHidingViews.swift
//  Animations
//
//  Created by MICHAIL SHAKHVOROSTOV on 13.09.2023.
//

import SwiftUI

struct ShowHidingViews: View {
    
    @State private var isShowing = false
    
    var body: some View {
        Button("Tap me") {
            withAnimation{
                isShowing.toggle()
            }
        }
        
        if isShowing{
            Rectangle()
                .fill(.red)
                .frame(width: 200, height: 200)
                .transition(.asymmetric(insertion: .scale, removal: .identity))
        }
    }
}


#Preview {
    ShowHidingViews()
}
