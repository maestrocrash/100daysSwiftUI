//
//  ListStyleView.swift
//  Moonshot
//
//  Created by MICHAIL SHAKHVOROSTOV on 20.09.2023.
//

import SwiftUI

struct ListStyleView: View {
    let astronaut: [String: Astronaut] = Bundle.main.decode("astronauts.json")
    let missions: [Mission] = Bundle.main.decode("missions.json")
    
    var body: some View {
        List {
            ForEach(missions) {mission in
                NavigationLink {
                    MissionView(mission: mission, astronauts: astronaut)
                } label: {
                    Image(mission.image)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 104, height: 72)
                    
                    Spacer()
                    
                    VStack(alignment: .trailing) {
                        Text(mission.displayName)
                            .font(.headline)
                        Text(mission.formattedLaunchDate)
                            .font(.subheadline)
                    }
                }
            }
            .listRowBackground(Color.darkBackground)
            
        }
        .navigationTitle("Moonshot")
        .background(.darkBackground)
        .scrollContentBackground(.hidden)
        
    }
    
}

#Preview {
    ListStyleView()
}
