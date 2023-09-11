//
//  StepperView.swift
//  project4
//
//  Created by MICHAIL SHAKHVOROSTOV on 07.09.2023.
//

import SwiftUI

struct StepperView: View {
    
    @State private var sleepAmount = 8.0
    
    var body: some View {
        Stepper("\(sleepAmount.formatted()) hours sleep", value: $sleepAmount, in: 4...12, step: 0.25)
    }
}

#Preview {
    StepperView()
}
