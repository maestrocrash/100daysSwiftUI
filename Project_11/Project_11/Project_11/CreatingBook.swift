//
//  CreatingBook.swift
//  Project_11
//
//  Created by MICHAIL SHAKHVOROSTOV on 02.10.2023.
//

import SwiftUI

struct CreatingBook: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: []) var books: FetchedResults<Book>
    
    @State private var showAddScreen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) {book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.raiting)
                                .font(.largeTitle)
                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                
                                Text(book.author ?? "Unknonw Author")
                                    .foregroundStyle(.secondary)
                            }
                        }
                    }
                    
                }
            }
            .navigationTitle("BookWorm")
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button {
                        showAddScreen.toggle()
                    } label: {
                        Label("Add books", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddScreen, content: {
                AddsBook()
            })
        }
    }
}

#Preview {
    CreatingBook()
}
