//
//  Favourites.swift
//  SnowSeeker
//
//  Created by Anmol Chawla on 03/11/24.
//

import SwiftUI

@Observable
class Favourites {
    private var resorts: Set<String>
    private let key = "favourites"
    
    init() {
        self.resorts = Set(UserDefaults.standard.stringArray(forKey: key) ?? [])
    }
    
    func contains(_ resort: Resort) -> Bool {
        resorts.contains(resort.id)
    }
    
    func add(_ resort: Resort) {
        resorts.insert(resort.id)
        save()
    }
    
    func remove(_ resort: Resort) {
        resorts.remove(resort.id)
        save()
    }
    
    func save() {
        UserDefaults.standard.set(Array(resorts), forKey: key)
    }
}
