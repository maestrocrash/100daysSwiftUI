//
//  Button.swift
//  GuessTheFlag
//
//  Created by MICHAIL SHAKHVOROSTOV on 29.08.2023.
//

import SwiftUI


struct ButtonView: View {
    var body: some View {
        VStack(alignment: .center, spacing: 20) {
            Button("Delete rows 1",  action: deleteRows)
                .buttonStyle(.bordered)
            
            Button(action: deleteRows, label: {
               Label("Edit", systemImage: "pencil")
                    .foregroundStyle(.gray)})
                .buttonStyle(.bordered)
    
                   
                   
            Button("Delete rows 3",  action: deleteRows)
                .buttonStyle(.borderedProminent)
                .tint(.mint)
                .foregroundStyle(.red)
            
            Button("Delete rows 4", role: .destructive, action: deleteRows)
                .buttonStyle(.borderedProminent)
            
            Button(action: deleteRows, label: {
                HStack {
                    Image(systemName: "pencil")
                    Text("TAAPAPPP")
                }
                .padding(20)
                .background(.black)
                .foregroundColor(.white)
            })
        }
            
    }
}


extension ButtonView {
    func deleteRows() {
        print("Delete rows")
    }
}

#Preview {
    ButtonView()
}
