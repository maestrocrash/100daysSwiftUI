//
//  ShowMessage.swift
//  GuessTheFlag
//
//  Created by MICHAIL SHAKHVOROSTOV on 29.08.2023.
//

import SwiftUI


struct ShowMessageView: View {
    
    @State private var showningAlert = false
    
    var body: some View {
        VStack(spacing: 20) {
            Text("Show")
            
            Button("Tap and show alert") {
               
                showningAlert = true
            }
            .alert("Title", isPresented: $showningAlert) {
                    Button("Cancel", role: .cancel) { }
                    Button("Destructive", role: .destructive) { }
            } message: {
                Text("Message text")
            }
        }
    }
}

#Preview {
    ShowMessageView()
}
