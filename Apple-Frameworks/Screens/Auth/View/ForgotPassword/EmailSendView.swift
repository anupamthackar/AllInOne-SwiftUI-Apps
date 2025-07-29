//
//  EmailSendView.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 21/07/25.
//

import SwiftUI

struct EmailSendView: View {
   @EnvironmentObject var authRouter: AuthRouter
   var body: some View {
      VStack(spacing: 24) {
         Spacer()
         Image(systemName: "envelope.fill")
            .resizable()
            .scaledToFit()
            .frame(width: 100, height: 100)
            .foregroundStyle(.teal)

         VStack(spacing: 8){
            Text("Check your email")
               .font(.largeTitle.bold())
            Text("We have send a password recover instruction to your email.")
               .font(.subheadline).fontWeight(.semibold)
               .foregroundStyle(.secondary)
         }

         Button(action: {
            authRouter.popToRoot()
         }, label: {
            Text("Skip, I'll Confirm Laters")
         })
         .buttonStyle(CapsuleButtonStyle())

         Spacer()

         Button(
            action: {
               authRouter.pop()
            },
            label: {
            Text("Did not receive the email? Check your spam filter, or ")
               .foregroundStyle(.gray)
            +
            Text("try another email address")
               .foregroundStyle(.teal)
         })
      }
      .padding()
      .toolbarRole(.editor)
   }
}

#Preview {
   EmailSendView()
}
