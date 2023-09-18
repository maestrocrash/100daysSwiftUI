//
//  ShowHidingView.swift
//  Project_7
//
//  Created by MICHAIL SHAKHVOROSTOV on 14.09.2023.
//

import SwiftUI


struct SecondView: View {
    
    @Environment (\.dismiss) var dismiss
    
    let name: String
    
    var body: some View {
        Text("Hello, \(name)")
        
        Button("Dismiss") {
            withAnimation(.default) {
                dismiss()
            }
        }
    }
}

struct ShowHidingView: View {
    
    @State private var showView = false
    
    var body: some View {
        Button("Tap me") {
            showView.toggle()
        }
        .sheet(isPresented: $showView){
            SecondView(name: "Michail")
        }
    }
}



//#Preview {
//    ShowHidingView()
//}
