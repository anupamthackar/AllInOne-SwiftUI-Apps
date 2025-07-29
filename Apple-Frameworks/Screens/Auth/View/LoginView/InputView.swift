//
//  InputView.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 21/07/25.
//

import SwiftUI

struct InputView: View {
   let placeholder: String
   let isSecureField: Bool
   @Binding var text: String

   var body: some View {
      VStack(spacing: 12) {
         if isSecureField {
            SecureField(placeholder, text: $text)
         } else {
            TextField(placeholder, text: $text)
         }

         Divider()
      }
   }
}

#Preview {
//   InputView(placeholder: "Email or Phone Number", isSecureField: false, tex)
}
