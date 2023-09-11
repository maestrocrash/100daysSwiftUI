//
//  DatePickerView.swift
//  project4
//
//  Created by MICHAIL SHAKHVOROSTOV on 07.09.2023.
//

import SwiftUI


struct DatePickerView: View {
    
    @State private var wakeUp = Date.now
    
    var body: some View {
        VStack(spacing: 20) {
            DatePicker("Please enter a date", selection: $wakeUp, in: Date.now..., displayedComponents: .date)
                .labelsHidden()
            Text("\(wakeUp)")
        }
        .padding(20)
    }
    
//    func exampleTime() {
//        let tommorow = Date.now.addingTimeInterval(86400)
//        let range = Date.now...tommorow
//    }
    
}


#Preview {
    DatePickerView()
}
