//
//  ConceptView.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 23/06/25.
//

import SwiftUI

struct ConceptView: View {
   private let data = 1..<10
   let adaptiveColumns = [GridItem(.adaptive(minimum: 150))]
   private let whiteGredient = LinearGradient(gradient: Gradient(colors: [.black, .white] ), startPoint: .topLeading, endPoint: .bottomTrailing)
   var body: some View {
      NavigationStack {
         ZStack{
            ContainerRelativeShape()
               .fill(whiteGredient)
               .ignoresSafeArea()
            VStack {
               Section {
                  Text("Topics")
                     .font(.largeTitle)
                     .fontWeight(.bold)
                     .foregroundStyle(.white)
               }
               
               ScrollView {
                  LazyVGrid(columns: adaptiveColumns) {
                     ForEach(LandingViewGridItems.allCases, id: \.self) { item in
                        
                        NavigationLink(destination: item.destination) {
                           VStack {
                              Image("\(item.icon)")
                                 .resizable()
                                 .scaledToFit()
                                 .frame(width: 100, height: 100, alignment: .center)
                              
                              Text("\(item.title)")
                              //                                                            .minimumScaleFactor(0.9)
                                 .foregroundStyle(.white)
                                 .font(.headline)
                                 .fontWeight(.light)
                                 .multilineTextAlignment(.center)
                           }
                        }
                        .padding()
                     }
                  }
                  .padding()
               }
            }
            
         }
      }
   }
   
   
}

#Preview {
    ConceptView()
}
