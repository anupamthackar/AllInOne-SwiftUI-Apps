//
//  ContentView.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 16/06/25.
//

import SwiftUI
import CoreData

struct ContentView: View {
   @EnvironmentObject var authViewModel: AuthViewModel
   var body: some View {

      Group {
         if authViewModel.userSession == nil {
            LoginView()
         } else {
            LandingView()
         }
      }
      .environmentObject(authViewModel)
   }
}


#Preview {
   ContentView()
}
