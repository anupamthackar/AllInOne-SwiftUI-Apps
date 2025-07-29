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
   case mask
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
      case .mask: return "mask"
      }
   }
   
   var icon: String {
      switch self {
      case .stateBinding: return "pin"
      case .stateObjectObservedObject: return "doller"
      case .navigation: return "clock"
      case .environmentObject: return "math"
      case .attirbute: return "user"
      case .mask: return "user"
         
      }
   }
   
   var title: String {
      switch self {
      case .stateBinding: return "State & Binding"
      case .stateObjectObservedObject: return "StateObject & ObservedObject"
      case .navigation: return "Navigations"
      case .environmentObject: return "EnvironmentObject"
      case .attirbute: return "Attirbute"
      case .mask: return "Mask"
      }
   }
   

   var destination: ConceptRouter.ConceptFlow {
       switch self {
       case .stateBinding:
           return .bindState
       case .stateObjectObservedObject:
           return .stateObjectObservedObject
       case .navigation:
             return .stateObjectObservedObject
       case .environmentObject:
           return .environmentObject
       case .attirbute:
             return .stateObjectObservedObject
       case .mask:
           return .mask
       }
   }}


enum AppsViewGridItems: CaseIterable, Identifiable {
   
   case sectionKey
   case svp
   
   var id: String {
      switch self {
      case .sectionKey: return "sectionKey"
         
      case .svp: return "svp"
      }
   }
   
   var icon: String {
      switch self {
      case .sectionKey: return "pin"
      case .svp: return "doller"
      }
   }
   
   var title: String {
      switch self {
      case .sectionKey: return "List Section Header"
      case .svp: return "Landmark"
      }
   }

   var destination: AppRouter.AppFlow {
      switch self {
         case .sectionKey: return .sectionKey
         case .svp: return .landmark
      }
   }
}





