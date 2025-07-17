//
//  AppMainView.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 16/07/25.
//

import SwiftUI

struct AppMainView: View {
   let adaptiveColumns = [GridItem(.adaptive(minimum: 150))]
    var body: some View {
       ScrollView {
          VStack {
             LazyVGrid(columns: adaptiveColumns, content: {
                ForEach(AppsViewGridItems.allCases, id: \.self) { item in
                   NavigationLink(destination: item.destination) {
                      VStack {
                         Image("\(item.icon)")
                            .resizable()
                            .scaledToFit()
                            .frame(width: 100, height: 100, alignment: .center)
                         
                         Text("\(item.title)")
                            .foregroundStyle(.black)
                            .font(.headline)
                            .fontWeight(.light)
                            .multilineTextAlignment(.center)
                      }
                   }
                   .padding()
                }
             })
          }
       }
       .navigationTitle("Apps")
       .navigationBarTitleDisplayMode(.large)
    }
}

#Preview {
    AppMainView()
}
