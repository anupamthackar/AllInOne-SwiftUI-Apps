//
//  Router.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 22/07/25.
//

import SwiftUI

struct Item: Codable, Hashable {
   var name: String
   var price: Double
}

final class AuthRouter: ObservableObject {

   @Published var path = NavigationPath()

   enum AuthFlow: Hashable, Codable {
      case login
      case createAccount(items: Item, name: String)
      case profile
      case forgotPassword
      case emailSent
   }

   func navigate(to flow: AuthFlow) {
      path.append(flow)
   }

   func pop() {
      path.removeLast()
   }

   func popToRoot() {
      path.removeLast(path.count)
   }
}

extension AuthRouter {

   @ViewBuilder
   func destination(for flow: AuthFlow) -> some View {
      switch flow {
         case .login : LoginView()
         case .createAccount(let item, let name) : CreateAccountView(
            item: item,
            name: name
         )
         case .profile: ProfileView()
         case .forgotPassword: ForgotPasswordView()
         case .emailSent: EmailSendView()
      }
   }
}

