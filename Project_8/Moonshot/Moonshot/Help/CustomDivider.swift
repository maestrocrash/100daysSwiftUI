//
//  CustomDivider.swift
//  Moonshot
//
//  Created by MICHAIL SHAKHVOROSTOV on 20.09.2023.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

#Preview {
    CustomDivider()
}
