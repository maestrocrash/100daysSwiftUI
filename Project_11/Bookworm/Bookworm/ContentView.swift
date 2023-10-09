//
//  ContentView.swift
//  Bookworm
//
//  Created by MICHAIL SHAKHVOROSTOV on 02.10.2023.
//

import SwiftUI

struct ContentView: View {
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var students: FetchedResults<Student>
    
    var body: some View {
        VStack {
            List(students) {student in
                Text(student.name ?? "Unknown")
            }
            
            Button("Add") {
                let firstName = ["Ginny", "Harry", "Hermione", "Luna", "Ron"]
                let lastName = ["Potter", "Granger", "Lovegood", "Weasley"]
              
                let student = Student(context: moc)
                student.id = UUID()
                student.name = "\(firstName.randomElement()!) \(lastName.randomElement()!)"
                
                try? moc.save()
            }
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
