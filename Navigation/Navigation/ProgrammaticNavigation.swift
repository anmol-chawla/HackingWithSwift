//
//  ProgrammaticNavigation.swift
//  Navigation
//
//  Created by Anmol Chawla on 29/07/24.
//

import SwiftUI

struct ProgrammaticNavigation: View {
    @State private var path = [Int]()
    
    var body: some View {
        NavigationStack(
            path: $path,
            root: {
                VStack(content: {
                    Button("Show 32") {
                        path = [32]
                    }
                    
                    Button("Show 43") {
                        path.append(43)
                    }
                    
                    Button("Show 32 then 43") {
                        path = [32, 43]
                    }
                })
                .navigationDestination(for: Int.self, destination: { selection in
                    Text("You select \(selection)")
                })
            }
        )
    }
}

#Preview {
    ProgrammaticNavigation()
}
