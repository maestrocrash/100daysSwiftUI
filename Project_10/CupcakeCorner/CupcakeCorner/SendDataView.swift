//
//  SendDataView.swift
//  CupcakeCorner
//
//  Created by MICHAIL SHAKHVOROSTOV on 27.09.2023.
//

import SwiftUI

struct Responce: Codable {
    var results: [Result]
}

struct Result: Codable {
    
    var trackId: Int
    var trackName: String
    var collectionName: String
    
}

struct SendDataView: View {
    @State private var results = [Result]()
    
    var body: some View {
        List(results, id: \.trackId) {item in
            VStack(alignment: .leading) {
                Text(item.trackName)
                    .font(.headline)
                Text(item.collectionName)
            }
            
        }
        .task {
            await loadData()
        }
    }
    
    func loadData() async {
        guard let url = URL(string: "https://itunes.apple.com/search?term=taylor+swift&entity=song") else {
            print("Invalid URL")
            return
        }
        
        
        do {
            
            let (data, _) = try await URLSession.shared.data(from: url)
            
            if let decoderResponce = try? JSONDecoder().decode(Responce.self, from: data) {
                results = decoderResponce.results
            }
            
        } catch {
            print("Invalid data")
        }
    }
}

#Preview {
    SendDataView()
}
