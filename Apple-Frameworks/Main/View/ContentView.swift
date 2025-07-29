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
   @EnvironmentObject var authRouter: AuthRouter

   @ObservedObject var conceptRouter = ConceptRouter()
   @ObservedObject var appRouter = AppRouter()

   var body: some View {

      Group {
         if authViewModel.userSession == nil {
            LoginView()
         } else {
            LandingView()
               .environmentObject(conceptRouter)
               .environmentObject(appRouter)
         }
      }
      .animation(Animation.easeInOut(duration: 0.5), value: authViewModel.userSession)
      .environmentObject(authViewModel)
      .environmentObject(authRouter)



   }
}


#Preview {
   ContentView()
      .environmentObject(AuthViewModel())
      .environmentObject(AuthRouter())
      .environmentObject(ConceptRouter())
}
