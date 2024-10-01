//
//  ProspectsView.swift
//  HotProspects
//
//  Created by Anmol Chawla on 01/10/24.
//

import SwiftData
import SwiftUI

struct ProspectsView: View {
    enum FilterType {
        case none
        case contacted
        case uncontacted
    }
    
    @Environment(\.modelContext) var modelContext
    @Query(sort: \Prospect.name) var prospects: [Prospect]
    
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
    
    init(filter: FilterType) {
        self.filter = filter
        
        if filter != .none {
            let showContactedOnly = filter == .contacted
            
            _prospects = Query(
                filter: #Predicate { $0.isContacted == showContactedOnly},
                 sort: [SortDescriptor(\Prospect.name)]
            )
        }
    }
    
    var body: some View {
        NavigationStack {
            List(prospects) { prospect in
                VStack(alignment: .leading) {
                    Text(prospect.name)
                        .font(.headline)
                    
                    Text(prospect.emailAdress)
                        .foregroundStyle(.secondary)
                }
                
            }
            .navigationTitle(title)
            .toolbar {
                Button("Scan", systemImage: "qrcode.viewfinder") {
                    let prospect = Prospect(name: "Anmol Chawla", emailAdress: "an.chawla@icloud.com", isContacted: false)
                    modelContext.insert(prospect)
                }
            }
            
        }
    }
}

#Preview {
    ProspectsView(filter: .none)
        .modelContainer(for: Prospect.self)
}
