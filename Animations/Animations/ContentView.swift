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
    @State private var animationAmount3 = 1.0
    
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
            
            Spacer()
            
            Stepper("Scale amount", value: $animationAmount2.animation(), in: 1...10)
            
            Button("Tap Me") {
                animationAmount2 += 1
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(.circle)
            .scaleEffect(animationAmount2)
            
            Spacer()
            
            Button("Tap Me") {
                withAnimation(.spring(duration: 1,bounce: 0.5)) {
                    animationAmount3 += 360
                }
            }
            .padding(40)
            .background(.red)
            .foregroundColor(.white)
            .clipShape(.circle)
            .rotation3DEffect(
                .degrees(animationAmount3),
                axis: (x: 0.0, y: 0.1, z: 1.0)
            )
        }
    }
}

#Preview {
    ContentView()
}
