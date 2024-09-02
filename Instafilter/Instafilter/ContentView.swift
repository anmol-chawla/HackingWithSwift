//
//  ContentView.swift
//  Instafilter
//
//  Created by Anmol Chawla on 22/08/24.
//

import SwiftUI

struct ContentView: View {
    @State private var processedImage: Image?
    @State private var filterIntensity = 0.5
    
    var body: some View {
        NavigationStack(root: {
            VStack(content: {
                Spacer()
                
                if let processedImage {
                    processedImage
                        .resizable()
                        .scaledToFit()
                } else {
                    ContentUnavailableView(
                        "No picture",
                        systemImage: "photo.badge.plus",
                        description: Text("Tap to import a photo")
                    )
                }
                
                Spacer()
                
                HStack(content: {
                    Text("Intensity")
                    Slider(value: $filterIntensity)
                })
                
                HStack(content: {
                    Button("Change Filter", action: changeFilter)
                    
                    Spacer()
                })
            })
            .padding([.horizontal, .bottom])
            .navigationTitle("Instafilter")
        })
    }
    
    func changeFilter() {
        
    }
}

#Preview {
    ContentView()
}
