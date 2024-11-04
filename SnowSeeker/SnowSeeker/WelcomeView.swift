//
//  WelcomeView.swift
//  SnowSeeker
//
//  Created by Anmol Chawla on 02/11/24.
//

import SwiftUI

struct WelcomeView: View {
    var body: some View {
        VStack {
            Text("Welcome to SnowSeeker")
                .font(.largeTitle)
            
            Text("Please select a resort form the left hand menu; Swipe from the edge to show it")
                .foregroundStyle(.secondary)
        }
    }
}

#Preview {
    WelcomeView()
}
