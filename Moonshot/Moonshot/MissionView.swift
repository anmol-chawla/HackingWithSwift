//
//  MissionView.swift
//  Moonshot
//
//  Created by Anmol Chawla on 28/07/24.
//

import SwiftUI

struct CustomDivider: View {
    var body: some View {
        Rectangle()
            .frame(height: 2)
            .foregroundStyle(.lightBackground)
            .padding(.vertical)
    }
}

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
                    CustomDivider()
                    
                    Text("Mission Highlights")
                        .font(.title.bold())
                        .padding(.bottom, 5)
                    
                    Text(mission.description)
                    
                    CustomDivider()
                    
                    Text("Crew")
                        .font(.title.bold())
                        .padding(.bottom, 5)
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
                                        destination: { AstronautView(astronaut: crewMember.astronaut) },
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
                                                        .foregroundStyle(.white.opacity(0.5))
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
                .padding(.top)
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
