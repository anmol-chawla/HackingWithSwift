//
//  ContentView.swift
//  Navigation
//
//  Created by Anmol Chawla on 29/07/24.
//

import SwiftUI

struct Student: Hashable {
    var id = UUID()
    var name: String
    var age: Int
}

struct ContentView: View {
    var body: some View {
        NavigationStack(root: {
            List(
                0..<100,
                rowContent: { i in
                    NavigationLink("Select \(i)", value: i)
                }
             )
            .navigationDestination(for: Int.self, destination: { selection in
                Text("You selected \(selection)")
            })
            .navigationDestination(for: Student.self, destination: { selection in
                Text("You selected \(selection.name)")
            })
        })
    }
}

#Preview {
    ContentView()
}
