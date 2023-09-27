//
//  ImagePaint.swift
//  DrawProject
//
//  Created by MICHAIL SHAKHVOROSTOV on 25.09.2023.
//

import SwiftUI

struct ImagePaintView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            .frame(width: 300, height: 300)
            //.background(Image("ExampleCar"))
            .border(ImagePaint(image: Image("Example"), scale: 0.4), width: 50)
        
        Capsule()
            .strokeBorder(ImagePaint(image: Image("Example"), scale: 0.4), lineWidth: 50)
            .frame(width: 300, height: 300)
        
    }
}

#Preview {
    ImagePaintView()
}
