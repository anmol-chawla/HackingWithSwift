//
//  ContentView.swift
//  FriendFace
//
//  Created by Anmol Chawla on 01/09/24.
//

import SwiftUI

struct ContentView: View {
    @State private var users: [User] = [User]()
    
    @State private var showingError: Bool = false
    @State private var errorMessage: String = ""
    
    var body: some View {
        NavigationStack(root: {
            List(content: {
                ForEach(users, content: { user in
                    NavigationLink(destination: {
                        Text(user.about)
                    }, label: {
                        VStack(content: {
                            Text(user.name)
                        })
                    })
                })
            })
            .navigationTitle("FriendFace")
        }).onAppear(perform: {
            Task(operation: {
                await fetchUsers()
            })
        })
        .alert(
            "Error!",
            isPresented: $showingError,
            actions: {
                Button("Retry") {
                    Task(operation: {
                        await fetchUsers()
                    })
                }
            },
            message: {
                Text(errorMessage)
            }
        )
    }
    
    func fetchUsers() async {
        let userListURL = URL(string: "https://www.hackingwithswift.com/samples/friendface.json")!
        
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .iso8601
        var request = URLRequest(url: userListURL)
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        request.httpMethod = "GET"
        
        do {
            let (data, _) = try await URLSession.shared.data(for: request)
            let decodedUsers = try decoder.decode([User].self, from: data)
            users = decodedUsers
            
        } catch {
            print("User fetch failed: \(error)")
            errorMessage = "Failed to fetch users. Please retry"
            showingError = true
        }
    }
}

#Preview {
    ContentView()
}
