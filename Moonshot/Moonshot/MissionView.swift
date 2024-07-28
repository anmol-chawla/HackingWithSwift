//
//  MissionView.swift
//  Moonshot
//
//  Created by Anmol Chawla on 28/07/24.
//

import SwiftUI

struct MissionView: View {
    struct CrewMember {
        let role: String
        let astronaut: Astronaut
    }
    
    let mission: Mission
    let crew: [CrewMember]
    
    init(mission: Mission, astronauts: [String: Astronaut]) {
        self.mission = mission
        
        self.crew = mission.crew.map { member in
            if let astronaut = astronauts[member.name] {
                return CrewMember(role: member.role, astronaut: astronaut)
            } else {
                fatalError("Missing \(member.name)")
            }
        }
    }
    
    var body: some View {
        ScrollView(content: {
            VStack(content: {
                Image(mission.image)
                    .resizable()
                    .scaledToFit()
                    .containerRelativeFrame(
                        .horizontal,
                        { width, axis in width * 0.6}
                    )
                
                VStack(alignment: .leading, content: {
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                })
                .padding(.horizontal)
                
                ScrollView(
                    .horizontal,
                    showsIndicators: false,
                    content: {
                        HStack(content: {
                            ForEach(
                                crew,
                                id: \.role,
                                content: { crewMember in
                                    NavigationLink(
                                        destination: { Text("Astronaut details") },
                                        label: {
                                            HStack(content: {
                                                Image(crewMember.astronaut.id)
                                                    .resizable()
                                                    .frame(width: 104, height: 72)
                                                    .clipShape(.capsule)
                                                    .overlay(
                                                        Capsule()
                                                            .strokeBorder(.white, lineWidth: 1)
                                                    )
                                                
                                                VStack(alignment: .leading, content: {
                                                    Text(crewMember.astronaut.name)
                                                        .foregroundStyle(.white)
                                                        .font(.headline)
                                                    
                                                    Text(crewMember.role)
                                                        .foregroundStyle(.secondary)
                                                })
                                            })
                                            .padding(.horizontal)
                                        }
                                    )
                                }
                            )
                        })
                    }
                )
            })
            .padding(.bottom)
        })
        .navigationTitle(mission.displayName)
        .navigationBarTitleDisplayMode(.inline)
        .background(.darkBackground)
    }
}

#Preview {
    let missions: [Mission] = Bundle.main.decode("missions.json")
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    return MissionView(mission: missions[0], astronauts: astronauts)
        .preferredColorScheme(.dark)
}
