//
//  Apple_FrameworksApp.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 16/06/25.
//

import SwiftUI
import FirebaseCore

class AppDelegate: NSObject, UIApplicationDelegate{
   func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
      FirebaseApp.configure()
      return true
   }
}

@main
struct Apple_FrameworksApp: App {

   @StateObject private var authViewModel = AuthViewModel()

   // register app delegate
   @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

   @ObservedObject private var authRouter = AuthRouter()

   var body: some Scene {
      WindowGroup {
         NavigationStack(path: $authRouter.path){
            ContentView()
               .navigationDestination(
                  for: AuthRouter.AuthFlow.self) { destination in
                     authRouter.destination(for: destination)
                  }
         }
         .environmentObject(authViewModel)
         .environmentObject(authRouter)
      }
   }
}
