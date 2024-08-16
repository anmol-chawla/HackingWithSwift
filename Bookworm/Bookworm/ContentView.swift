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
    @Query var books: [Book]
    
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
                                
                                Text(book.author)
                                    .foregroundStyle(.secondary)
                            })
                        })
                    })
                })
            })
            .navigationTitle("Bookworm")
                .toolbar(content: {
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
}

#Preview {
    ContentView()
}
