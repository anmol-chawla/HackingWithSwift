//
//  ContentView.swift
//  Animations
//
//  Created by Anmol Chawla on 02/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    
    var body: some View {
        Button("Tap Me") {
            animationAmount += 1
        }
        .padding(50)
        .background(.red)
        .foregroundColor(.white)
        .clipShape(.circle)
        .scaleEffect(animationAmount)
        .animation(.default, value: animationAmount)
    }
}

#Preview {
    ContentView()
}
