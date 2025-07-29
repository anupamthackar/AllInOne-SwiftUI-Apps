//
//  Router+Auth.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 22/07/25.
//

import SwiftUI


final class ConceptRouter: ObservableObject {
   @Published var path = NavigationPath()

   enum ConceptFlow: Hashable, Codable {
      case bindState
      case mask
      case stateObjectObservedObject
      case environmentObject
   }

   func navigate(to flow: ConceptFlow) {
      path.append(flow)
   }

   func pop() {
      path.removeLast()
   }

   func popToRoot() {
      path.removeLast(path.count)
   }
}

extension ConceptRouter {

   @ViewBuilder
   func conceptDestination(for flow: ConceptFlow) -> some View {
      switch flow {
         case .bindState: StateBindView()
         case .mask: Mask()
         case .stateObjectObservedObject: StateObjectObservedObject()
         case .environmentObject: EOHomeView()
      }
   }
}






