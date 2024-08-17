//
//  AddBookView.swift
//  Bookworm
//
//  Created by Anmol Chawla on 15/08/24.
//

import SwiftUI

struct AddBookView: View {
    @Environment(\.modelContext) var modelContext
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var author = ""
    @State private var rating = 3
    @State private var genre = BookGenres.Fantasy
    @State private var review = ""
    
    private var containsInvalidEntries: Bool {
        if (title.isEmpty || author.isEmpty) {
            print ("in title")
            return true
        }
        
        if (!BookGenres.allCases.contains(genre)) {
            print("in generes")
            return true
        }
        
        if (!(1...5 ~= rating)) {
            return true
        }
        
        print("is valid")
        return false
    }
        
    var body: some View {
        NavigationStack(root: {
            Form(content: {
                Section(content: {
                    TextField("Name of the book", text: $title)
                    TextField("Author's name", text: $author)
                    
                    Picker("Genre", selection: $genre, content: {
                        ForEach(BookGenres.allCases, id: \.self, content: {
                            Text($0.rawValue)
                        })
                    })
                })
                
                Section("Write a review", content: {
                    TextEditor(text: $review)
                    RatingView(rating: $rating)
                })
                
                Section(content: {
                    Button("Save", action: {
                        let newBook = Book(title: title, author: author, genre: genre, review: review, rating: rating)
                        modelContext.insert(newBook)
                        dismiss()
                    }).disabled(containsInvalidEntries)
                })
            })
            .navigationTitle("Add Book")
        })
    }
}

#Preview {
    AddBookView()
}
