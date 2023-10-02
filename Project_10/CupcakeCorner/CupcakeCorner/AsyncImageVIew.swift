//
//  AsyncImageVIew.swift
//  CupcakeCorner
//
//  Created by MICHAIL SHAKHVOROSTOV on 27.09.2023.
//

import SwiftUI

struct AsyncImageVIew: View {
    
    private var urlImage = URL(string: "https://is1-ssl.mzstatic.com/image/thumb/Music114/v4/32/b5/6b/32b56b49-0075-7128-e6ec-7c3c4c697242/00843930000821.rgb.jpg/100x100bb.jpg")
    
    var body: some View {
        AsyncImage(url: urlImage) {phase in
            
            if let image = phase.image {
                image
                    .resizable()
                    .scaledToFill()
            } else if phase.error != nil {
                Text("No image the in url")
            } else {
                ProgressView()
                    .progressViewStyle(.circular)
            }
        }
        .frame(width: 200, height: 200, alignment: .center)
    }
}

#Preview {
    AsyncImageVIew()
}
