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
      if let user = authViewModel.currentUser {
         List {
            Section {
               HStack(spacing: 16) {
                  Text(user.initials)
                     .font(.title)
                     .fontWeight(.semibold)
                     .foregroundStyle(.white)
                     .frame(width: 70, height: 70)
                     .background(Color(.lightGray))
                     .clipShape(Circle())
                  VStack(alignment: .leading, spacing: 4) {
                     Text(user.fullName)
                        .font(.headline)
                     Text(user.email)
                        .font(.footnote)
                  }
               }
            }

            Section("Account") {
               Button(action: {
                  authViewModel.signOut()
               }, label: {
                  Label {
                     Text("Sign Out")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                  } icon: {
                     Image(systemName: "arrow.left.circle.fill")
                        .foregroundStyle(.red)
                  }
               })
               Button(action: {
                  Task {
                     await authViewModel.deleteAccount()
                  }
               }, label: {
                  Label {
                     Text("Delete Account")
                        .fontWeight(.semibold)
                        .foregroundStyle(.black)
                  } icon: {
                     Image(systemName: "xmark.circle.fill")
                        .foregroundStyle(.red)
                  }
               })
            }
         }
      } else {
         ProgressView("Please Wait...")
      }
   }
}

#Preview {
   ProfileView()
      .environmentObject(AuthViewModel())
}
