//
//  ForgotPassword.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 21/07/25.
//

import SwiftUI

struct ForgotPasswordView: View {
   @State var email: String = ""
   @EnvironmentObject var authViewModel: AuthViewModel
   @EnvironmentObject var authRouter: AuthRouter

   var body: some View {
      VStack {
         VStack(alignment: .leading, spacing: 8) {
            Text("Reset Password")
               .font(.largeTitle)
            Text(.init("Enter the email associated with your account and we'll send an email with instruction to reset your password"))
               .font(.subheadline)
               .foregroundStyle(.secondary)
         }
         .padding(.bottom, 32)

         InputView(
            placeholder: "Enter your email",
            isSecureField: false,
            text: $email
         )
         .padding(.bottom, 16)

         Button(action: {

            Task {
               await authViewModel.resetPassword(by: email)
               if !authViewModel.isError {
//                  isEmailSent = true
                  authRouter.navigate(to: .emailSent)
               }
            }
         }, label: {
               Text("Send Instruction")
            })
         .buttonStyle(CapsuleButtonStyle())

         Spacer()
      }
      .onAppear {
         email = ""
      }
      .padding()
      .toolbarRole(.editor)
   }
}

#Preview {
   ForgotPasswordView()
}
