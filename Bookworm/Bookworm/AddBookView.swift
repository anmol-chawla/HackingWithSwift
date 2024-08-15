//
//  AddBookView.swift
//  Bookworm
//
//  Created by Anmol Chawla on 15/08/24.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = "Fantasy"
    @State private var review = ""
    
    let genres = ["Fantasy", "Horror", "Kids", "Mystery", "Poetry", "Romance", "Thriller"]
    
    var body: some View {
        NavigationStack(root: {
            Form(content: {
                Section(content: {
                    TextField("Name of the book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre, content: {
                        ForEach(genres, id: \.self, content: {
                            Text($0)
                        })
                    })
                })
                
                Section("Write a review", content: {
                    TextEditor(text: $review)
                    
                    Picker("Rating", selection: $rating, content: {
                        ForEach(0..<6, content: {
                            Text(String($0))
                        })
                    })
                })
                
                Section(content: {
                    Button("Save", action: {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                    })
                })
            })
            .navigationTitle("Add Book")
        })
    }
}

#Preview {
    AddBookView()
}
