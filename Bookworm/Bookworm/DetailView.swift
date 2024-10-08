//
//  DetailView.swift
//  Bookworm
//
//  Created by Anmol Chawla on 16/08/24.
//

import SwiftData
import SwiftUI

struct DetailView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var showingDeleteAlert = false
    
    let book: Book
    
    var body: some View {
        ScrollView(content: {
            ZStack(alignment: .bottomTrailing, content: {
                Image(book.genre.rawValue)
                    .resizable()
                    .scaledToFit()
                
                Text(book.genre.rawValue.uppercased())
                    .fontWeight(.black)
                    .padding(8)
                    .foregroundStyle(.white)
                    .background(.black.opacity(0.5))
                    .clipShape(.capsule)
                    .offset(x: -5, y: -5)
            })
            
            Text(book.author)
                .font(/*@START_MENU_TOKEN@*/.title/*@END_MENU_TOKEN@*/)
                .foregroundStyle(.secondary)
            
            Text(book.review)
                .padding()
            
            RatingView(rating: .constant(book.rating))
                .font(.largeTitle)
        })
        .navigationTitle(book.title)
        .navigationBarTitleDisplayMode(.inline)
        .scrollBounceBehavior(.basedOnSize)
        .alert(
            "Delete Book",
            isPresented: $showingDeleteAlert,
            actions: {
                Button("Delete", role: .destructive, action: deleteBook)
                Button("Cancel", role: .cancel, action: {})
            },
            message: {
                Text("Are you sure?")
            })
        .toolbar(content: {
            Button("Delete this book", systemImage: "trash", action: {
                showingDeleteAlert = true
            })
        })
    }
    
    func deleteBook() {
        modelContext.delete(book)
        dismiss()
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: Book.self, configurations: config)
        let example = Book(title: "Test Book", author: "Test Author", genre: BookGenres.Fantasy, review: "This was a great book", rating: 4)
        
        return DetailView(book: example)
            .modelContainer(container)
    } catch {
        return Text("Failed to create preview: \(error.localizedDescription)")
    }
}
