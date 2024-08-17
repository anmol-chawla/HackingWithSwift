//
//  ContentView.swift
//  Bookworm
//
//  Created by Anmol Chawla on 13/08/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    @Query(
        sort: [
            SortDescriptor(\Book.rating, order: .reverse),
            SortDescriptor(\Book.title),
            SortDescriptor(\Book.author)
        ]
    ) var books: [Book]
    
    @State private var showingAddScreen = false
    
    var body: some View {
        NavigationStack(root: {
            List(content: {
                ForEach(books, content: { book in
                    NavigationLink(value: book, label: {
                        HStack(content: {
                            EmojiRatingView(rating: book.rating)
                                .font(.largeTitle)
                            
                            VStack(alignment: .leading, content: {
                                Text(book.title)
                                    .font(.headline)
                                    .foregroundStyle(book.rating == 1 ? .red : .primary)
                                
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            })
                        })
                    })
                })
                .onDelete(perform: deleteBooks)
            })
            .navigationTitle("Bookworm")
            .navigationDestination(for: Book.self , destination: { book in
                DetailView(book: book)
            })
            .toolbar(content: {
                ToolbarItem(placement: .topBarLeading, content: {
                    EditButton()
                })
                    ToolbarItem(placement: .topBarTrailing, content: {
                        Button(
                            "Add Book",
                            systemImage: "plus",
                            action: {
                                showingAddScreen.toggle()
                            }
                       )
                    })
                })
        })
        .sheet(isPresented: $showingAddScreen, content: {
            AddBookView()
        })
    }
    
    func deleteBooks(at offsets: IndexSet) {
        for offset in offsets {
            let book = books[offset]
            
            modelContext.delete(book)
        }
    }
}

#Preview {
    ContentView()
}
