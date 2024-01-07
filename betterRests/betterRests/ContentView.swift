//
//  ContentView.swift
//  betterRests
//
//  Created by Anmol Chawla on 07/01/24.
//

import SwiftUI

struct ContentView: View {
    @State private var wakeUp = Date.now
    var body: some View {
        DatePicker(
            "Please enter a date",
            selection: $wakeUp,
            in: Date.now...
        ).labelsHidden()
    }
}

#Preview {
    ContentView()
}
