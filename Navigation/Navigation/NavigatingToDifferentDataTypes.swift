//
//  NavigatingToDifferentDataTypes.swift
//  Navigation
//
//  Created by Anmol Chawla on 30/07/24.
//

import SwiftUI

struct NavigatingToDifferentDataTypes: View {
    @State private var path = NavigationPath()
    
    var body: some View {
        NavigationStack(path: $path, root: {
            List(content: {
                ForEach(0..<5, content: { i in
                    NavigationLink("Select Numnber : \(i)", value: i)
                })
                
                ForEach(0..<5, content: { i in
                    NavigationLink("Select String \(i)", value: String(i))
                    
                })
            })
            .toolbar(content: {
                Button("Push 557") {
                    path.append(556)
                }
                
                Button("Push Hello") {
                    path.append("Hello")
                }
            })
            .navigationDestination(for: Int.self, destination: { selection in
                Text("You selected the number \(selection)")
            })
            .navigationDestination(for: String.self, destination: { selection in
                Text("You selected the string \(selection)")
            })
        })
    }
}

#Preview {
    NavigatingToDifferentDataTypes()
}
