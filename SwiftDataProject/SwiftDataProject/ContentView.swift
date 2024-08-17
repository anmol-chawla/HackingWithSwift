//
//  ContentView.swift
//  SwiftDataProject
//
//  Created by Anmol Chawla on 17/08/24.
//

import SwiftData
import SwiftUI

struct ContentView: View {
    @Environment(\.modelContext) var modelContext
    
    @Query(
        filter: #Predicate<User> { user in
            if user.name.localizedStandardContains("R") {
                if user.city == "London" {
                    return true
                } else {
                    return false
                }
            } else {
                return false
            }
         },
       sort: \User.name
    ) var users: [User]
    
    var body: some View {
        NavigationStack(root: {
            List(users, rowContent: { user in
                    Text(user.name)
            })
            .navigationTitle("Users")
            .toolbar(content: {
                Button("Add Sample User", systemImage: "plus", action: {
                    try? modelContext.delete(model: User.self)
                    
                    let first = User(name: "Ed Sheeran", city: "London", joinDate: .now.addingTimeInterval(86400 * -10))
                    let second = User(name: "Rosa Diaz", city: "New York", joinDate: .now.addingTimeInterval(86400 * -5))
                    let third = User(name: "Roy Kent", city: "London", joinDate: .now.addingTimeInterval(86400 * 5))
                    let fourth = User(name: "Jhonny English", city: "London", joinDate: .now.addingTimeInterval(86400 * 10))
                    
                    modelContext.insert(first)
                    modelContext.insert(second)
                    modelContext.insert(third)
                    modelContext.insert(fourth)
                })
            })
        })
    }
}

#Preview {
    ContentView()
}
