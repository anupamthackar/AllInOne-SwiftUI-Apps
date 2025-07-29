import SwiftUI

struct CapsuleButtonStyle: ButtonStyle {
   var bgColor: Color = .teal
   var textColor: Color = .white
   var isDisabled: Bool = false
   var hasBorder: Bool = false
   func makeBody(configuration: Configuration) -> some View {
      configuration.label
         .foregroundStyle(textColor)
                     .padding()
                     .frame(maxWidth: .infinity)
                     .background(Capsule().fill(isDisabled ? Color.gray : bgColor))
                     .opacity(isDisabled ? 0.6 : 1)
                     .scaleEffect(configuration.isPressed && !isDisabled ? 0.95 : 1)
                     .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)
                     .overlay(content: {
                        hasBorder ?
                        Capsule().stroke(.gray ,lineWidth: 1) :
                        nil
                     })
   }
}
