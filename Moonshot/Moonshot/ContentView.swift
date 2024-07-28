//
//  ContentView.swift
//  Moonshot
//
//  Created by Anmol Chawla on 16/07/24.
//

import SwiftUI


struct GridView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView(content: {
            LazyVGrid(columns: columns, content: {
                ForEach(missions) { mission in
                    NavigationLink(destination: {
                        MissionView(mission: mission, astronauts: astronauts)
                    }, label: {
                        VStack(content: {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .padding()
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.gray)
                            }
                            .padding(.vertical)
                            .frame(maxWidth: .infinity)
                            .background(.lightBackground)
                        })
                        .clipShape(.rect(cornerRadius: 10))
                        .overlay(
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        )
                    })
                }
            })
            .padding([.horizontal, .bottom])
        })
    }
}

struct ListView: View {
    let missions: [Mission]
    let astronauts: [String: Astronaut]
    
    var body: some View {
        List(content: {
            ForEach(missions, content: { mission in
                NavigationLink(
                    destination: { MissionView(mission: mission, astronauts: astronauts) },
                    label: {
                        HStack(content: {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 50, height: 50)
                                .padding(.horizontal)
                            
                            Text(mission.displayName)
                                .font(.headline)
                                .foregroundStyle(.white)
                            
                            Text("(\(mission.formattedLaunchDate))")
                                .font(.caption)
                                .foregroundStyle(.gray)
                        })
                    }
                )
            })
            .listRowBackground(Color.darkBackground)
            .listRowSeparator(/*@START_MENU_TOKEN@*/.visible/*@END_MENU_TOKEN@*/)
        })
        .listStyle(.plain)
    }
}

struct ContentView: View {
    enum ViewType {
        case list
        case grid
    }
    
    let astronauts: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    @State var viewType: ViewType = .grid
    
    var body: some View {
        NavigationStack(
            root: {
                Group {
                    viewType == .grid
                    ? AnyView(GridView(missions: missions, astronauts: astronauts))
                    : AnyView(ListView(missions: missions, astronauts: astronauts))
                }
                .navigationTitle("Moonshot")
                .toolbar(content: {
                    Button(
                        action: { withAnimation { viewType = viewType == .grid ? .list : .grid } },
                        label: { Image(systemName: viewType == .grid ? "list.bullet" : "square.grid.2x2").foregroundColor(.white.opacity(0.7)) }
                    )
                })
                .background(.darkBackground)
                .preferredColorScheme(.dark)
            }
        )
    }
}

#Preview {
    ContentView()
}
