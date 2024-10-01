//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Anmol Chawla on 01/10/24.
//

import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case none
        case contacted
        case uncontacted
    }
    
    let filter: FilterType
    
    var title: String {
        switch filter {
            case .none:
                "Everyone"
            case .contacted:
                "Contacted people"
            case .uncontacted:
                "Uncontacted people"
        }
    }
    
    var body: some View {
        NavigationStack {
            Text("Hello world")
                .navigationTitle(title)
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
}
