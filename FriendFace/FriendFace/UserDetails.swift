//
//  UserDetails.swift
//  FriendFace
//
//  Created by Anmol Chawla on 01/09/24.
//

import SwiftUI

struct UserDetails: View {
    var user: User
    var allUsers: [User]
    
    @State private var showExpandedDetails: Bool = false
    
    var body: some View {
            VStack(content: {
                List(content: {
                   Section("About", content: {
                       Text(user.about)
                           .lineLimit(showExpandedDetails ? nil : 2)
                   })
                   .onTapGesture(perform: {
                       withAnimation {
                           showExpandedDetails.toggle()
                       }
                   })
                    
                    Section("User Details", content: {
                        LabeledContent("Age", value: "\(user.age)")
                        LabeledContent("Company", value: user.company)
                        LabeledContent(
                            content: {
                                Text(user.email)
                                    .foregroundStyle(.blue)
                            },
                            label: { Text("Email") }
                        )
                        LabeledContent("Address", value: user.address)
                    })
                    
                    Section("Friends", content: {
                        ForEach(user.friends, content: { friend in
                            let friendUser = allUsers.first(where: { $0.id == friend.id })
                            
                            NavigationLink(destination: {
                                if friendUser != nil {
                                    UserDetails(user: friendUser!, allUsers: allUsers)
                                } else {
                                    Text("No user found")
                                }
                            }, label: {
                                Text(friendUser?.name ?? friend.name)
                            })
                            .disabled(friendUser == nil)
                        })
                    })
                })
            .navigationTitle(user.name)
        })
    }
}

#Preview {
    UserDetails(user: User(id: UUID(), isActive: true, name: "Test User", age: 18, company: "Test Company", email: "test@test.com", address: "Test Address", about: "Test desccription", registered: .now, tags: ["test tag 1", "test tag 2"], friends: [Friend(id: UUID(), name: "Test Friend")]), allUsers: [])
}
