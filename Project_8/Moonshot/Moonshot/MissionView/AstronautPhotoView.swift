//
//  AstronautPhotoView.swift
//  Moonshot
//
//  Created by MICHAIL SHAKHVOROSTOV on 20.09.2023.
//

import SwiftUI

struct AstronautPhotoView: View {

    let crew: [CrewMember]
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(crew, id: \.role) {crewMemder in
                    NavigationLink {
                        AstronautView(astronaut: crewMemder.astronaut)
                    } label: {
                        HStack {
                            Image(crewMemder.astronaut.id)
                                .resizable()
                                .frame(width: 104, height: 72)
                                .clipShape(Capsule())
                                .overlay {
                                    Capsule()
                                        .strokeBorder(.white,
                                        lineWidth: 1)
                                }
                            
                            VStack(alignment: .leading) {
                                Text(crewMemder.astronaut.name)
                                    .foregroundStyle(.white)
                                    .font(.headline)
                                
                                Text(crewMemder.role)
                                    .foregroundStyle(.yellow.opacity(0.8))
                            }
                        }
                        .padding(.horizontal)
                    }
                    
                }
            }
        }
    }
}


