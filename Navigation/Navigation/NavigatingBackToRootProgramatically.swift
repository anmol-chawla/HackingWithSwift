//
//  NavigatingBackToRootProgramatically.swift
//  Navigation
//
//  Created by Anmol Chawla on 30/07/24.
//

import SwiftUI

struct DetailView: View {
    var number: Int
    @Binding var path: NavigationPath
    
    var body: some View {
        NavigationLink("Go to random number", value: Int.random(in: 1...1000))
            .navigationTitle("Number: \(number)")
            .toolbar(content: {
                Button("Home", action: {
                    path = NavigationPath()
                })
            })
    }
}

struct NavigatingBackToRootProgramatically: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path, root: {
            DetailView(number: 0, path: $path)
                .navigationDestination(for: Int.self, destination: { i in
                    DetailView(number: i, path: $path)
                })
        })
    }
}

#Preview {
    NavigatingBackToRootProgramatically()
}
