//
//  DateBlockView.swift
//  Bookworm2
//
//  Created by MICHAIL SHAKHVOROSTOV on 09.10.2023.
//

import SwiftUI

struct DateBlockView: View {
    let book: Book
    
    init(book: Book) {
        self.book = book
    }
    
    @Environment(\.managedObjectContext) var moc
    
    private var dayFormatter: DateFormatter = {
       let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "d"
        
        return dateFormatter
    }()
    
    private var monthFormatter: DateFormatter  = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MMMM YYYY"
        
        return dateFormatter
    }()

    var body: some View {
        HStack {
            VStack(spacing: 5) {
                Text("Start")
                    .font(.headline)
                Text(dayFormatter.string(from: book.date ?? Date.now))
                    .font(.largeTitle)
                Text(monthFormatter.string(from: book.date ?? Date.now))
                    .font(.caption)
            }
            .blockStyleView(.purple)
            
            
            ZStack {
                VStack(spacing: 5) {
                    Text("End")
                        .font(.headline)
                    Text(dayFormatter.string(from: book.dateEnd ?? Date.now ))
                        .font(.largeTitle)
                    Text(monthFormatter.string(from: book.dateEnd ?? Date.now))
                        .font(.caption)
                }
                .opacity(book.isHidden ? 1 : 0)
                
                Button("End read") {
                    book.isHidden.toggle()
                    book.dateEnd = Date.now
                    
                    try? moc.save()
                }
                .font(.title)
                .opacity(book.isHidden ? 0 : 1)
            }
            .blockStyleView(.blue)
        }
        
        Text("Книга прочитана за \(dateDiff(dateStart: book.date ?? Date.now, dateEnd: book.dateEnd ?? Date.now).day!) дней")
            .font(.caption)
            .foregroundStyle(.secondary)
            .padding(.top, 10)
            .opacity(book.isHidden ? 1 : 0)
    }
}
