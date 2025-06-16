//
//  Apple_FrameworksApp.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 16/06/25.
//

import SwiftUI

@main
struct Apple_FrameworksApp: App {
    let persistenceController = PersistenceController.shared

    var body: some Scene {
        WindowGroup {
            ContentView()
                .environment(\.managedObjectContext, persistenceController.container.viewContext)
        }
    }
}
