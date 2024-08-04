//
//  HabitView.swift
//  HabbitTracker
//
//  Created by Anmol Chawla on 04/08/24.
//

import SwiftUI

struct HabitView: View {
    @Binding var trackedHabbits: TrackedHabbits
    
    var habbit: Habbit
    
    var body: some View {
        NavigationStack(root: {
            List(content: {
                Section("Description", content: {
                    Text(habbit.description)
                })
                
                Section("Count", content: {
                    HStack(content: {
                        Text("Times")
                        Spacer()
                        Text("\(habbit.count)")
                    })
                })
            })
            .navigationTitle(habbit.name)
            .toolbar(content: {
                ToolbarItem(placement: .bottomBar, content: {
                    Button("Increment count", action: {
                        guard let currentHabbitIndex = trackedHabbits.habbits.firstIndex(of: habbit) else {
                            fatalError("Could not find a habbit within the list of tracked habbit")
                        }
                        
                        var updatedHabbit = habbit
                        updatedHabbit.count += 1
                        trackedHabbits.habbits[currentHabbitIndex] = updatedHabbit
                    })
                })
            })
        })
    }
}
//
//#Preview {
//    HabitView(trackedHabbits: TrackedHabbits(), habbit: Habbit(name: "test", description: "test", count: 0))
//}
