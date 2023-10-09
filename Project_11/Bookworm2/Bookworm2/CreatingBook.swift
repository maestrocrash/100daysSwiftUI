//
//  CreatingBook.swift
//  Bookworm2
//
//  Created by MICHAIL SHAKHVOROSTOV on 03.10.2023.
//

import SwiftUI

struct CreatingBook: View {
    
    @Environment(\.managedObjectContext) var moc
    @FetchRequest(sortDescriptors: [
        SortDescriptor(\.title),
        SortDescriptor(\.author)
    ]) var books: FetchedResults<Book>
    
    @State private var showAddScreen = false
    
    var body: some View {
        NavigationStack {
            List {
                ForEach(books) { book in
                    NavigationLink {
                        DetailView(book: book)
                    } label: {
                        HStack {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading) {
                                Text(book.title ?? "Unknown Title")
                                    .font(.headline)
                                    .foregroundStyle(book.rating == 1 ? .red : .black)
                                
                                Text(book.author ?? "Unknown Author")
                                    .foregroundStyle(.secondary)
                            }
                        }
                        
                    }
                }
                .onDelete(perform: deleteBook)
            }
            .navigationTitle("BookWorm")
            .toolbar {
                ToolbarItem(placement: .topBarLeading) {
                    EditButton()
                }
                
                ToolbarItem(placement: .topBarTrailing) {
                    Button{
                        showAddScreen.toggle()
                    }label: {
                        Label("Add books", systemImage: "plus")
                    }
                }
            }
            .sheet(isPresented: $showAddScreen, content: {
                AddBook()
            })
        }
    }
    
    func deleteBook(at offSets: IndexSet) {
        for offset in offSets {
            let book = books[offset]
            moc.delete(book)
        }
        
        try? moc.save()
    }
}

#Preview {
    CreatingBook()
}
