//
//  IconStyleView.swift
//  Moonshot
//
//  Created by MICHAIL SHAKHVOROSTOV on 20.09.2023.
//

import SwiftUI

struct IconStyleView: View {
    
    let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    let columns = [
        GridItem(.adaptive(minimum: 150))
    ]
    
    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(missions) {mission in
                    NavigationLink {
                        MissionView(mission: mission, astronauts: astronaut)
                    } label: {
                        VStack {
                            Image(mission.image)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 104, height: 104)
                                .padding(.top)
                            
                            VStack {
                                Text(mission.displayName)
                                    .font(.headline)
                                    .foregroundStyle(.white)
                                
                                Text(mission.formattedLaunchDate)
                                    .font(.caption)
                                    .foregroundStyle(.white.opacity(0.5))
                            }
                            .padding(.vertical)
                            .frame(maxWidth:.infinity)
                            .background(.lightBackground)
                        }
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        .overlay {
                            RoundedRectangle(cornerRadius: 10)
                                .stroke(.lightBackground)
                        }
                    }
                }
            }
        }
        .navigationTitle("Moonshot")
        .background(.darkBackground)
    }
}
