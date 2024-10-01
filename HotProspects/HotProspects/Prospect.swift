//
//  Prospects.swift
//  HotProspects
//
//  Created by Anmol Chawla on 01/10/24.
//

import SwiftData

@Model
class Prospect {
    var name: String
    var emailAdress: String
    var isContacted: Bool
    
    init(name: String, emailAdress: String, isContacted: Bool) {
        self.name = name
        self.emailAdress = emailAdress
        self.isContacted = isContacted
    }
}
