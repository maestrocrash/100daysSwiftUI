//
//  CustomStyleBlockDate.swift
//  Bookworm2
//
//  Created by MICHAIL SHAKHVOROSTOV on 09.10.2023.
//

import SwiftUI

struct CustomStyleBlockDate: ViewModifier {
    var color: Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .shadow(color: Color.white.opacity(0.8), radius: 4, x: 0, y: 2)
            .padding()
            .frame(width: UIScreen.main.bounds.width / 2 - 50,
                   height: 100,
                   alignment: .center)
            .background(color)
            .clipShape(RoundedRectangle(cornerRadius: 20))
            .shadow(color: color.opacity(0.6), radius: 8, x: 0, y: 4)
  }
}

struct CapsuleCardStyle:  ViewModifier {
  var color: Color

  func body(content: Content) -> some View {
    content
      .font(.title)
      .foregroundColor(.white)
      .padding()
      .background(
        Capsule().fill(color)
      )
      .background(
        Capsule().fill(color.opacity(0.4)).rotationEffect(.init(degrees: -8))
      )
      .background(
        Capsule().fill(color.opacity(0.4)).rotationEffect(.init(degrees: 4))
      )
      .background(
        Capsule().fill(color.opacity(0.4)).rotationEffect(.init(degrees: 8))
      )
      .background(
        Capsule().fill(color.opacity(0.4)).rotationEffect(.init(degrees: -4))
      )
  }
}


struct customModifier: View {
    
    var body: some View {
        Text("TextTextTextText")
            .blockStyleView(.blue)
    }
    
}

extension View {
    func blockStyleView(_ color: Color) -> some View {
        modifier(CustomStyleBlockDate(color: color))
    }
    
    func blockShadowView() -> some View{
        modifier(CapsuleCardStyle(color: .blue))
    }
}

#Preview {
    customModifier()
}
