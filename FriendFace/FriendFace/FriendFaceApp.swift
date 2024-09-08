//
//  FriendFaceApp.swift
//  FriendFace
//
//  Created by Anmol Chawla on 01/09/24.
//

import SwiftData
import SwiftUI

@main
struct FriendFaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: User.self)
    }
}
