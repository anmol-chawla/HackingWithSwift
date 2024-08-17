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
    
    @Query(sort: \User.name) var users: [User]
    
    @State private var path = [User]()
    
    var body: some View {
        NavigationStack(path: $path, root: {
            List(users, rowContent: { user in
                NavigationLink(value: user, label: {
                    Text(user.name)
                })
            })
            .navigationTitle("Users")
            .navigationDestination(for: User.self, destination: { user in
                EditUserView(user: user)
            })
            .toolbar(content: {
                Button("Add User", systemImage: "plus", action: {
                    let user = User(name: "", city: "", joinDate: .now)
                    modelContext.insert(user)
                    path = [user]
                })
            })
        })
    }
}

#Preview {
    ContentView()
}
