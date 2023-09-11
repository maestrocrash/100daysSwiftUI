//
//  workingWithDate.swift
//  project4
//
//  Created by MICHAIL SHAKHVOROSTOV on 07.09.2023.
//

import SwiftUI


struct WorkingWithDate: View {
    
    var body: some View {
        Text(Date.now, format: .dateTime.day().month().year())
        Text(Date.now.formatted(date: .long, time: .omitted) )
        Button("Tap button") {
            trivialExample()
        }
    }
    
    func trivialExample() {
        
        //        let now = Date.now
        //        let tommorow = Date.now.addingTimeInterval(86400)
        //        let range = now...tommorow
        
//        var components = DateComponents()
//            components.hour = 8
//            components.minute = 0
//        
//        let date = Calendar.current.date(from: components) ?? Date.now
//        
//        print(date)
        
        
        let components = Calendar.current.dateComponents([.hour, .minute], from: Date.now)
        let hour = components.hour ?? 0
        let minute = components.minute ?? 0
        
        
        
    }
    
    
    
}


#Preview {
    WorkingWithDate()
}
