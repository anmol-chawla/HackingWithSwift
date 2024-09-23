//
//  Result.swift
//  BucketList
//
//  Created by Anmol Chawla on 17/09/24.
//

import Foundation

struct Result: Codable {
    let query: Query
}

struct Query: Codable {
    let pages: [Int: Page]
}

struct Page: Codable, Comparable {
    enum CodingKeys: String, CodingKey {
        case pageID = "pageid"
        case title
        case terms
    }
    
    let pageID: Int
    let title: String
    let terms: [String: [String]]?
    
    var description : String {
        terms?["description"]?.first ?? "N/A"
    }
    
    static func < (lhs: Page, rhs: Page) -> Bool {
        return lhs.title < rhs.title
    }
}
