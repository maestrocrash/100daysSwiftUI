//
//  ValidatingForms.swift
//  CupcakeCorner
//
//  Created by MICHAIL SHAKHVOROSTOV on 27.09.2023.
//

import SwiftUI

struct ValidatingForms: View {
    
    @State private var username = ""
    @State private var email = ""
    
    var body: some View {
        Form {
            Section {
                TextField("Username", text: $username)
                TextField("Email", text: $email)
            }
            
            Section {
                Button("Create account") {
                    print("Create account..")
                }
                .buttonStyle(.borderedProminent)
            }
            .disabled(disableForm)
        }
    }
    
    var disableForm: Bool {
        username.count < 5 || email.count < 5
    }
}

#Preview {
    ValidatingForms()
}
