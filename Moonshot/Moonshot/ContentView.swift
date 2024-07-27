//
//  ContentView.swift
//  Moonshot
//
//  Created by Anmol Chawla on 16/07/24.
//

import SwiftUI

struct ContentView: View {
    let astronauts = Bundle.main.deccodeAstronaut("astronauts.json")
    
    var body: some View {
        VStack {
            Image(systemName: "globe")
                .imageScale(.large)
                .foregroundStyle(.tint)
            Text("Hello, world!")
        }
        .padding()
    }
}

#Preview {
    ContentView()
}
