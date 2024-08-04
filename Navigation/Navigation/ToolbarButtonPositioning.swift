//
//  ToolbarButtonPositioning.swift
//  Navigation
//
//  Created by Anmol Chawla on 31/07/24.
//

import SwiftUI

struct ToolbarButtonPositioning: View {
    var body: some View {
        NavigationStack(root: {
            Text("Hello, world!")
                .toolbar(content: {
                    ToolbarItemGroup(placement: .confirmationAction, content: {
                        Button("Tap Me", action: {})
                        
                        Button("Tap Me", action: {})
                    })
                })
        })
    }
}

#Preview {
    ToolbarButtonPositioning()
}
