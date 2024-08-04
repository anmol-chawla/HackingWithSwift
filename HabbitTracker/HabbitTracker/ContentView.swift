//
//  ContentView.swift
//  HabbitTracker
//
//  Created by Anmol Chawla on 04/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var showAddSheet: Bool = false
    @State private var trackedHabbits: TrackedHabbits = TrackedHabbits()
    
    var body: some View {
       NavigationStack(root: {
           List(content: {
               ForEach(trackedHabbits.habbits) { habbit in
                   NavigationLink(destination: {
                       HabitView(trackedHabbits: $trackedHabbits, habbit: habbit)
                   }, label: {
                       Text(habbit.name)
                   })
               }
           })
           .navigationTitle("Habbits")
           .toolbar(content: {
               ToolbarItemGroup(placement: .bottomBar, content: {
                   Button("New Habbit", systemImage: "plus.circle.fill", action: {
                       showAddSheet.toggle()
                   })
                   .labelStyle(.titleAndIcon)
                   Spacer()
               })
           })
           .sheet(isPresented: $showAddSheet, content: {
              NewHabbit(trackedHabbits: trackedHabbits)
           })
       })
    }
}

#Preview {
    ContentView()
}
