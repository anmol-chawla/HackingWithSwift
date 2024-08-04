//
//  TrackedHabbits.swift
//  HabbitTracker
//
//  Created by Anmol Chawla on 04/08/24.
//

import Foundation

@Observable
class TrackedHabbits: Codable {
    var id: UUID = UUID()
    var habbits: [Habbit] {
        didSet {
            if let encoded = try? JSONEncoder().encode(habbits) {
                UserDefaults.standard.setValue(encoded, forKey: "habbits")
            }
        }
    }
    
    init() {
        if let savedItems = UserDefaults.standard.data(forKey: "habbits") {
            if let decodedItems = try? JSONDecoder().decode([Habbit].self, from: savedItems) {
                habbits = decodedItems
                return
            }
        }
        habbits = [Habbit(name: "Test", description: "Test description", count: 5)]
    }
}
