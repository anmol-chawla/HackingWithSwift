//
//  Habbit.swift
//  HabbitTracker
//
//  Created by Anmol Chawla on 04/08/24.
//

import Foundation

struct Habbit: Codable, Identifiable {
    var id: UUID = UUID()
    let name: String
    let description: String
    let count: Int
}
