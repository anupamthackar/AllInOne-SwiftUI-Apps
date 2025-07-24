//
//  Router+Concept.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 22/07/25.
//

import SwiftUI

final class AppRouter: ObservableObject {
   @Published var path = NavigationPath()

   enum AppFlow: Hashable, Codable {
      case landmark
      case sectionKey
   }

   func navigate(to flow: AppFlow) {
      path.append(flow)
   }

   func pop() {
      path.removeLast()
   }

   func popToRoot() {
      path.removeLast(path.count)
   }

   @ViewBuilder
   func appDestination(by flow: AppFlow) -> some View {
      switch flow {
         case .landmark: LandmarkView()
         case .sectionKey: SectionKey()
      }
   }
}
