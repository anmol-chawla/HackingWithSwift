//
//  StylingNavigationBar.swift
//  Navigation
//
//  Created by Anmol Chawla on 31/07/24.
//

import SwiftUI

struct StylingNavigationBar: View {
    var body: some View {
        NavigationStack(root: {
            List(0..<100, rowContent: { i in
                Text("Row \(i)")
                
            })
            .navigationTitle("Title goes here")
            .navigationBarTitleDisplayMode(.inline)
            .toolbarBackground(.blue, for: .navigationBar)
            .toolbarColorScheme(.dark)
            .toolbar(.hidden, for: .navigationBar)
        })
    }
}

#Preview {
    StylingNavigationBar()
}
