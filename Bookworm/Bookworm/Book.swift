//
//  Book.swift
//  Bookworm
//
//  Created by Anmol Chawla on 15/08/24.
//

import Foundation
import SwiftData

@Model
class Book {
    var title: String
    var author: String
    var genre: BookGenres
    var review: String
    var rating: Int
    
    init(title: String, author: String, genre: BookGenres, review: String, rating: Int) {
        self.title = title
        self.author = author
        self.genre = genre
        self.review = review
        self.rating = rating
    }
}
