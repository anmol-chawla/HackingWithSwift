//
//  ContentView.swift
//  Animations
//
//  Created by Anmol Chawla on 02/07/24.
//

import SwiftUI

struct ContentView: View {
    @State private var animationAmount = 1.0
    @State private var animationAmount2 = 1.0
    
    var body: some View {
        print(animationAmount2)
        
        return VStack {
            Button("Tap Me") {
            }
            .padding(50)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(.circle)
            .overlay(
                Circle()
                    .stroke(.red)
                    .scaleEffect(animationAmount)
                    .opacity(2 - animationAmount)
                    .animation(
                        .easeOut(duration: 1)
                        .repeatForever(autoreverses: false),
                        value: animationAmount
                    )
                
            )
            .onAppear {
                animationAmount = 2
            }
            
            Stepper("Scale amount", value: $animationAmount2.animation(), in: 1...10)
            
            Spacer()
            
            Button("Tap Me") {
                animationAmount2 += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount2)
        }
    }
}

#Preview {
    ContentView()
}
