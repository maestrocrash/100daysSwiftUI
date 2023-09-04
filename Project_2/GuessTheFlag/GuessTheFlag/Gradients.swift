//
//  Gradients.swift
//  GuessTheFlag
//
//  Created by MICHAIL SHAKHVOROSTOV on 29.08.2023.
//

import SwiftUI


struct Gradient: View  {
    
    var body: some View {
        
        
        ZStack {
  
            AngularGradient(colors: [.blue, .red, .green, .yellow, .blue], center: .top)
            
            //RadialGradient(colors: [.blue, .green], center: .center, startRadius: 20, endRadius: 400)
            
          //  LinearGradient(colors: [.blue, .white, .red], startPoint: .top, endPoint: .bottom)
            Text("text")
        }
        .ignoresSafeArea()
        
    
        
        
    }
    
}

#Preview {
    Gradient()
}
