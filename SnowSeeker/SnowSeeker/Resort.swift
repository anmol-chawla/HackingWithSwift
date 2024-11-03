//
//  Resort.swift
//  SnowSeeker
//
//  Created by Anmol Chawla on 02/11/24.
//

import Foundation

struct Resort: Codable, Hashable, Identifiable {
    var id: String
    var name: String
    var country: String
    var description: String
    var imageCredit: String
    var price: Int
    var size: Int
    var snowDepth: Int
    var elevation: Int
    var runs: Int
    var facilities: [String]
    
    static let allResorts: [Resort] = Bundle.main.decode("resorts.json")
    static let example = allResorts[0]
    
    var sizeText: String {
        switch size {
        case 1: "Small"
        case 2: "Average"
        case 3: "Large"
        default: "Large"
        }
    }
    
    var priceText: String {
        String(repeating: "$", count: price)
    }
}
