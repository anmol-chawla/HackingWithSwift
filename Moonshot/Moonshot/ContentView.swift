//
//  ContentView.swift
//  Moonshot
//
//  Created by Anmol Chawla on 16/07/24.
//

import SwiftUI

struct ContentView: View {
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        NavigationStack(
            root: {
                ScrollView(content: {
                    LazyVGrid(columns: columns, content: {
                        ForEach(missions) { mission in
                            NavigationLink(destination: {
                                Text("Detail View")
                            }, label: {
                                VStack(content: {
                                    Image(mission.image)
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 100, height: 100)
                                })
                                VStack {
                                    Text(mission.displayName)
                                        .font(.headline)
                                    
                                    Text(mission.formattedLaunchDate)
                                        .font(.caption)
                                }
                                .frame(maxWidth: .infinity)
                            })
                        }
                    })
                })
                .navigationTitle("Moonshot")
            }
        )
    }
}

#Preview {
    ContentView()
}
