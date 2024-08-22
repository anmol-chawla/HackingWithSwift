//
//  EditUserView.swift
//  SwiftDataProject
//
//  Created by Anmol Chawla on 17/08/24.
//

import SwiftData
import SwiftUI

struct EditUserView: View {
    @Bindable var user: User
    
    var body: some View {
        Form(content: {
            TextField("Name", text: $user.name)
            TextField("City", text: $user.city)
            DatePicker("Join Date", selection: $user.joinDate)
        })
        .navigationTitle("Edit User")
        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    do {
        let config = ModelConfiguration(isStoredInMemoryOnly: true)
        let container = try ModelContainer(for: User.self, configurations: config)
        let user = User(name: "Test User", city: "Test City", joinDate: .now)
        
        return EditUserView(user: user)
            .modelContainer(for: User.self)
    } catch {
        return Text("Error while creating a preview: \(error.localizedDescription)")
    }
}
