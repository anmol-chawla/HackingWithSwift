//
//  NavigatingBackToRootProgramatically.swift
//  Navigation
//
//  Created by Anmol Chawla on 30/07/24.
//

import SwiftUI

@Observable
class PathStore {
    var path: NavigationPath {
        didSet {
            save()
        }
    }
    
    private let savePath = URL.documentsDirectory.appending(path: "SavedPath")
    
    init() {
        if let data = try? Data(contentsOf: savePath) {
            if let decoded = try? JSONDecoder().decode(NavigationPath.CodableRepresentation.self, from: data) {
                path = NavigationPath(decoded)
                return
            }
        }
        
        path = NavigationPath()
    }
    
    func save() {
        guard let representation = path.codable else { return }
        
        do {
            let data = try JSONEncoder().encode(representation)
            try data.write(to: savePath)
        } catch {
            print("Failed to save navigation data")
        }
    }
}

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
    @State private var pathStore = PathStore()
    
    var body: some View {
        NavigationStack(path: $pathStore.path, root: {
            DetailView(number: 0, path: $pathStore.path)
                .navigationDestination(for: Int.self, destination: { i in
                    DetailView(number: i, path: $pathStore.path)
                })
        })
    }
}

#Preview {
    NavigatingBackToRootProgramatically()
}
