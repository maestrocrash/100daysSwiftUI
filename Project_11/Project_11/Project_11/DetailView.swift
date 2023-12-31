//
//  DetailView.swift
//  Project_11
//
//  Created by MICHAIL SHAKHVOROSTOV on 03.10.2023.
//

import SwiftUI

struct DetailView: View {
    
    let book: Book
    
    var body: some View {
        ScrollView {
            ZStack(alignment: .bottomTrailing) {
                Image(book.genre ?? "Fantasy")
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre?.uppercased() ?? "FANTASY")
                    .font(.caption)
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.75))
                    .clipShape(Capsule())
                    .offset(x: -5, y: -5)
            }
            
            Text(book.author ?? "Unknown Author")
                .font(.title)
                .foregroundStyle(.secondary)
            
            Text(book.review ?? "No review")
                .padding()
            
            RatingView(rating: .constant(Int(book.raiting)))
                .font(.largeTitle)
        }
        .navigationTitle(book.title ?? "Unknown Book")
        .navigationBarTitleDisplayMode(.inline)
    }
}

//#Preview {
//    DetailView()
//}
