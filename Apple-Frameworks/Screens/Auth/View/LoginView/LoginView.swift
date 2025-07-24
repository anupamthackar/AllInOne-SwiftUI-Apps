//
//  LoginView.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 21/07/25.
//

import SwiftUI

struct LoginView: View {

   @EnvironmentObject var authViewModel: AuthViewModel
   @EnvironmentObject var authRouter: AuthRouter

   @State var navigateToForget: Bool = false
   @State var email: String = ""
   @State var password: String = ""
   var body: some View {
      ScrollView {
         VStack(spacing: 16) {
            // Logo
            logo

            // Title
            titleView

            Spacer().frame(height: 12)

            // Input Field
            InputView(
               placeholder: "Email or Phone number",
               isSecureField: false,
               text: $email
            )
            InputView(
               placeholder: "Password",
               isSecureField: true,
               text: $password
            )

            // forget button
            forgotButton

            // login buttom
            loginButton

            Spacer()

            // bottom view
            bottomView

         }
      }
      .ignoresSafeArea()
      .padding(.horizontal)
      .padding(.vertical, 8)
      .alert("Something Went Wrong", isPresented: $authViewModel.isError){}

   }

   private var bottomView: some View {
      VStack(spacing: 16) {
         lineOrView
         appleButton
         googleButton
         footerView
      }
   }

   private var logo: some View {
      Image("Login")
         .resizable()
         .scaledToFit()
         .frame(width: 200, height: 200)
   }

   private var titleView: some View {
      Text("Let's Connect With Us!")
         .font(.title2).fontWeight(.semibold)
   }

   private var forgotButton: some View {
      HStack {

         Spacer()

         Button(
            action: {
               //               navigateToForget = true
               authRouter.navigate(to: .forgotPassword)
            },
            label: {
               Text("Foreget Password?")
                  .foregroundStyle(.gray)
                  .font(.subheadline)
                  .fontWeight(.medium)
            }
         )
      }
   }

   private var loginButton: some View {
      Button(
         action: {
            Task {
               await authViewModel.login(with: email, password: password)
            }
         },
         label: {
            Text("Login")
         }
      )
      .buttonStyle(
         CapsuleButtonStyle(
            bgColor: .blue.opacity(0.8),
            textColor: .white
         )
      )

   }

   private var lineOrView: some View {
      HStack(spacing: 16) {
         line
         Text("or")
         line
      }
      .foregroundStyle(.gray)
   }

   private var appleButton: some View {
      Button(
         action: {},
         label: {
            Label("Signup with Apple", systemImage: "apple.logo")
         }
      )
      .buttonStyle(CapsuleButtonStyle(bgColor: .black))


   }

   private var googleButton: some View {
      Button(
         action: {},
         label: {
            HStack {
               Image("google")
                  .resizable()
                  .frame(width: 15, height: 15)
               Text("Signup with Google")
            }
         })
      .buttonStyle(
         CapsuleButtonStyle(
            bgColor: .clear,
            textColor: .black,
            hasBorder: true
         )
      )
   }

   private var footerView: some View {

      Button(
         action: {
            authRouter.navigate(to: .createAccount(items: .init(name: "Anupam", price: 30.3), name: "Thackar"))
         },
         label: {
            HStack {
               Text("Don't have an account?")
                  .foregroundStyle(.black)
               Text("Signup")
                  .foregroundStyle(.blue.opacity(0.8))
            }
            .fontWeight(.medium)
         })
   }

   private var line: some View {
      VStack {Divider().frame(height: 1)}
   }
}

#Preview {
   LoginView()
      .environmentObject(AuthViewModel())
}

