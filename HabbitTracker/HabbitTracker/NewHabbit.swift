//
//  NewHabbit.swift
//  HabbitTracker
//
//  Created by Anmol Chawla on 04/08/24.
//

import SwiftUI

struct NewHabbit: View {
    @Environment(\.dismiss) var dismiss
   
    @State private var name: String = ""
    @State private var description: String = ""
    
    var trackedHabbits: TrackedHabbits
    
    var body: some View {
        NavigationStack(root: {
            Form(content: {
                TextField("Name", text: $name)
                TextField("Description", text: $description)
            })
            .navigationTitle("Track a new habbit")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar(content: {
                ToolbarItemGroup(content: {
                    Spacer()
                    Button(action: {
                        let newHabbit = Habbit(name: name, description: description, count: 0)
                        trackedHabbits.habbits.append(newHabbit)
                        dismiss()
                    }, label: {
                        Text("Create")
                    })
                    
                    Button(action: {
                        dismiss()
                    }, label: {
                        Text("Close")
                            .foregroundStyle(.red)
                    })
                })
            })
        })
    }
}

#Preview {
    NewHabbit(trackedHabbits: TrackedHabbits())
}
