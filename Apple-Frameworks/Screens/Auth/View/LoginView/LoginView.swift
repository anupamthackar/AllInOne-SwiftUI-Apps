//
//  LoginView.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 21/07/25.
//

import SwiftUI

struct LoginView: View {
   @State var email: String = ""
   @State var password: String = ""
   var body: some View {
      NavigationStack {
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
      }
   }

   private var bottomView: some View {
      VStack(spacing: 16){
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
            action: {},
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
         action: {},
         label: {
            Text("Login")
         }
      )
      .buttonStyle(CapsuleButtonStyle())

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
      NavigationLink(destination: {CreateAccountView()}, label: {
         HStack {
            Text("Don't have an account?")
               .foregroundStyle(.black)
            Text("Signup")
               .foregroundStyle(.teal)
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
}

