//
//  ProfileView.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 21/07/25.
//

import SwiftUI

struct ProfileView: View {
   @EnvironmentObject var authViewModel: AuthViewModel
    var body: some View {
       VStack {
          if let user = authViewModel.currentUser {
             Text("Hello, \(user.email)")
          } else {
             ProgressView("Please wait...")
          }

          Spacer()

          Button(action: {
             authViewModel.signOut()
          }, label: {
             Text("Logout")
          })
          .buttonStyle(CapsuleButtonStyle(bgColor: .red, textColor: .white))
       }
    }
}

#Preview {
    ProfileView()
}
