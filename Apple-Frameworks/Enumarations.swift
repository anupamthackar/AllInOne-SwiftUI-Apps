//
//  Enumarations.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 23/06/25.
//

import Foundation
import SwiftUI

enum LandingViewGridItems: CaseIterable, Identifiable {
   
   case stateBinding
   case stateObjectObservedObject
   case navigation
   case environmentObject
   case attirbute
   
   var id: String {
      switch self {
      case .stateBinding: return "stateBinding"
      case .stateObjectObservedObject: return "stateObjectObservedObject"
      case .navigation: return "navigation"
      case .environmentObject: return "environmentObject"
      case .attirbute: return "attirbute"
      }
   }
   
   var icon: String {
      switch self {
      case .stateBinding: return "pin"
      case .stateObjectObservedObject: return "doller"
      case .navigation: return "clock"
      case .environmentObject: return "math"
      case .attirbute: return "user"
      }
   }
   var title: String {
      switch self {
      case .stateBinding: return "State & Binding"
      case .stateObjectObservedObject: return "StateObject & ObservedObject"
      case .navigation: return "Navigations"
      case .environmentObject: return "EnvironmentObject"
      case .attirbute: return "Attirbute"
      }
   }
   
   @ViewBuilder
   var destination: some View {
      switch self {
      case .stateBinding:
         AnyView(StateBindView())
      case .stateObjectObservedObject:
         AnyView(StateBindView())
      case .navigation:
         AnyView(StateBindView())
      case .environmentObject:
         AnyView(StateBindView())
      case .attirbute:
         AnyView(StateBindView())
      }
   }
}
