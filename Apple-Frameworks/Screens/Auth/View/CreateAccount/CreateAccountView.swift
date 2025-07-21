//
//  CreateAccountView.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 21/07/25.
//

import SwiftUI

struct CreateAccountView: View {

   @EnvironmentObject var authViewModel: AuthViewModel
   @Environment(\.dismiss) var dismiss
   @State private var email: String = ""
   @State private var fullName: String = ""
   @State private var password: String = ""
   @State private var confirmPassword: String = ""

   var body: some View {
      VStack(spacing: 16) {
         Image("Signup")
            .resizable()
            .scaledToFit()
            .frame(width: 200, height: 200)

         Text("Please complete all information to create an account.")
            .font(.headline).fontWeight(.medium)
            .foregroundColor(.gray)
            .multilineTextAlignment(.center)
            .padding(.vertical)

         InputView(
            placeholder: "Email or Phone Number",
            isSecureField: false,
            text: $email
         )

         InputView(
            placeholder: "Full Name",
            isSecureField: false,
            text: $fullName
         )

         InputView(
            placeholder: "Password",
            isSecureField: true,
            text: $password
         )

         ZStack(alignment: .trailing) {
            InputView(
               placeholder: "Confirm Password",
               isSecureField: true,
               text: $confirmPassword
            )

            Spacer()

            if !password.isEmpty && !confirmPassword.isEmpty {
               Image(systemName: "\(isValidPassword ? "checkmark" : "xmark").circle.fill")
                  .imageScale(.large)
                  .fontWeight(.bold)
                  .foregroundColor(
                     isValidPassword ? Color(.systemGreen) : Color(.systemRed))
            }
         }


         Spacer()

         Button(
            action: {
               Task {
                  await authViewModel.createUser(
                     with: email,
                     fullName: fullName,
                     password: password
                  )
                  if !authViewModel.isError {
                     dismiss()
                  }
               }
            },
            label: {
               Text("Create Account")

            })
         .buttonStyle(CapsuleButtonStyle(bgColor: .blue.opacity(0.8)))
      }
      .navigationTitle("Set Up Your Account")
      .toolbarRole(.editor)
      .padding()
   }

   var isValidPassword: Bool {
      confirmPassword == password
   }
}

#Preview {
   CreateAccountView()
      .environmentObject(AuthViewModel())
}
