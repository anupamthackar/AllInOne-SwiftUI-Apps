//
//  User.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 21/07/25.
//

import Foundation


struct User: Codable {
   var id: String
   var email: String
   var fullName: String

   var initials: String {
      let formatter = PersonNameComponentsFormatter()
      if let components = formatter.personNameComponents(from: fullName) {
         formatter.style = .abbreviated
         return formatter.string(from: components)
      }
      return ""
   }
}
