//
//  LandingView.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 17/06/25.
//

import SwiftUI

struct LandingView: View {
   var body: some View {
      TabView {
         // MARK: - Concepts
         Group{
            NavigationStack {
               ConceptView()
            }
            .tabItem {
               Label("Concepts", systemImage: "rainbow")
            }
         }
         
         // MARK: - Apps
         Group {
            NavigationStack {
               VStack {
                  Text("Apps Upcoming")
               }
            }
            .tabItem {
               Label("Apps", systemImage: "storefront")
            }
         }
         
         // MARK: - Settings
         Group {
            NavigationStack {
               VStack {
                  Text("Setting Upcoming")
               }
            }
            .tabItem {
               Label("Settings", systemImage: "gear")
                  
            }
         }
      }

//      .background(.gray)
//      .clipShape(RoundedRectangle(cornerRadius: 20))
   }
}

#Preview {
   LandingView()
}
