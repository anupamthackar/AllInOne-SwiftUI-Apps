//
//  Mask.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 16/07/25.
//

import SwiftUI

struct Mask: View {
   @State private var moveGradientX: Bool = false
    var body: some View {
       let screenWidth = UIScreen.main.bounds.width
       
       Rectangle()
          .fill(Color.black)
          .overlay(
            LinearGradient(gradient: Gradient(colors: [.clear, .white, .clear]), startPoint: .leading, endPoint: .trailing)
               .offset(x:moveGradientX ? -screenWidth/2:  screenWidth/2)
          )
       
          .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: moveGradientX)
          .mask({
             Text("Run")
                .font(.title).fontWeight(.bold)
                .foregroundStyle(.white)
             Image(systemName: "figure.run")
                .resizable()
                .scaledToFit()
                .frame(width: 100, height: 100)
             Text("sadasdsadsadasd")
             
          })
          .onAppear {
             moveGradientX.toggle()
          }
    }
}

#Preview {
    Mask()
}
