//
//  ContentView.swift
//  HabbitTracker
//
//  Created by Anmol Chawla on 04/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var trackedHabbits: TrackedHabbits = TrackedHabbits()
    
    var body: some View {
       NavigationStack(root: {
           List(content: {
               ForEach(trackedHabbits.habbits) { habbit in
                   NavigationLink(destination: {
                       Text(habbit.description)
                   }, label: {
                       Text(habbit.name)
                   })
               }
           })
           .navigationTitle("Habbits")
           .toolbar(content: {
               ToolbarItemGroup(placement: .bottomBar, content: {
                       Button(action: {
                           print("")
                       }, label: {
                           Image(systemName: "plus.circle.fill")
                               .padding(.leastNonzeroMagnitude)
                           Text("New Habbit")
                   })
                   Spacer()
               })
           })
       })
    }
}

#Preview {
    ContentView()
}
