//
//  StateBind.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 17/06/25.
//

import SwiftUI

struct StateBindView: View {
   @State var number: Int = 0
   @State var isTransition: Bool = false
   
   let redGredient = LinearGradient(gradient: Gradient(colors: [.red, .white]), startPoint: .top, endPoint: .bottom)
   
   let blueGredient = LinearGradient(gradient: Gradient(colors: [.blue, .white]), startPoint: .topLeading, endPoint: .bottomTrailing)
   
   var body: some View {
      ZStack{
         ContainerRelativeShape()
            .fill(number > 5 ? redGredient: blueGredient)
            .ignoresSafeArea()

         VStack {
            Spacer()
            VStack {
               Text("\(number)")
               CustomView(number: $number)
               
               Divider()
               
               AnotherView(number: $number)
            }
            Spacer()
            
         }
      }
      .navigationTitle("State & Binding")
      .navigationBarTitleDisplayMode(.large)
      .onAppear
      {
         withAnimation(.easeInOut(duration: 2.0)){
            self.isTransition = true
         }
      }
      
      
   }
}



struct CustomView: View {
   @Binding var number: Int
   var body: some View {
      HStack {
         Button(action: {
            number += 1
         }) {
            
            Text("+")
               .foregroundStyle(.blue)
            
         }
         .buttonStyle(.bordered)
         Button("-") {
            if number > 0 {
               number -= 1
            }
         }
         .buttonStyle(.bordered)
      }
   }
}
struct AnotherView: View {
   @Binding var number: Int
   var body: some View {
      Text("\(number)")
      CustomView(number: $number)
      
   }
}


#Preview {
   StateBindView()
}
