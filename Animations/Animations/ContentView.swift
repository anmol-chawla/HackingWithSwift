//
//  ContentView.swift
//  Animations
//
//  Created by Anmol Chawla on 02/07/24.
//

import SwiftUI

struct CornerRotateModifier: ViewModifier {
    let amount: Double
    let anchor: UnitPoint
    
    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(amount), anchor: anchor)
            .clipped()
    }
}

extension AnyTransition {
    static var pivot: AnyTransition {
        .modifier(
            active: CornerRotateModifier(amount: -90, anchor: .topLeading),
            identity: CornerRotateModifier(amount: 0, anchor: .topLeading)
        )
    }
}

struct ContentView: View {
    let letters = Array("Hello, SwiftUI")
    
    @State private var animationAmount = 1.0
    @State private var animationAmount2 = 1.0
    @State private var animationAmount3 = 1.0
    @State private var enabled = false
    @State private var dragAmount = CGSize.zero
    @State private var lettersEnabled = false
    @State private var lettersDragAmount = CGSize.zero
    @State private var isShowing = false
    
    var body: some View {
        print(animationAmount2)
        
        return VStack {
            
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
            
            Spacer()
            
            Button("Tap Me") {
                enabled.toggle()
            }
            .frame(width: 200, height: 200)
            .background(enabled ? .blue : .red)
            .foregroundStyle(.white)
            .animation(.default, value: enabled)
            .clipShape(.rect(cornerRadius: enabled ? 60 : 0))
            .animation(.spring(duration: 1, bounce: 0.65), value: enabled)
            
            Spacer()
            
            LinearGradient(colors: [.yellow, .red], startPoint: .topLeading, endPoint: .bottomTrailing)
                .frame(width: 300, height: 200)
                .clipShape(.rect(cornerRadius: 10))
                .offset(dragAmount)
                .gesture(
                    DragGesture()
                        .onChanged { dragAmount = $0.translation }
                        .onEnded { _ in
                            withAnimation(.bouncy) {
                                dragAmount = .zero
                            }
                        }
                )
            
            Spacer()
            
            HStack(spacing: 2) {
                ForEach(0..<letters.count, id: \.self) { num in
                    Text(String(letters[num]))
                        .padding(5)
                        .font(.title)
                        .background(lettersEnabled ? .blue : .red)
                        .offset(lettersDragAmount)
                        .animation(.linear.delay(Double(num)/20), value: lettersDragAmount)
                }
            }
            .gesture(
                DragGesture()
                .onChanged { lettersDragAmount = $0.translation }
                .onEnded { _ in
                    lettersDragAmount = .zero
                    lettersEnabled.toggle()
                }
            )
            
            Spacer()
            
            Button("Tap Me") {
                withAnimation {
                    isShowing.toggle()
                }
            }
            
            if isShowing {
                Rectangle()
                    .fill(.red)
                    .frame(width: 200, height: 200)
                    .transition(.asymmetric(insertion: .scale, removal: .opacity))
            }
        }
    }
}

#Preview {
    ContentView()
}
