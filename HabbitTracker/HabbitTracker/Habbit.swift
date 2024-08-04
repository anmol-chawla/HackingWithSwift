//
//  Habbit.swift
//  HabbitTracker
//
//  Created by Anmol Chawla on 04/08/24.
//

import Foundation

struct Habbit: Codable, Equatable, Identifiable {
    var id: UUID = UUID()
    let name: String
    let description: String
    var count: Int
}
