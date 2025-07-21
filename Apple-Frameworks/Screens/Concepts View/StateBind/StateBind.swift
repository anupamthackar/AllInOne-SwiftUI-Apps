//
//  StateBind.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 17/06/25.
//

import SwiftUI

struct StateBindView: View {
   @State var number: Int = 0
   @State var isTransition: Bool = false
   @State var showSheet: Bool = false
   let screenWidth: CGFloat = UIScreen.main.bounds.width
   let redGredient = LinearGradient(gradient: Gradient(colors: [.red, .white]), startPoint: .top, endPoint: .bottom)
   
   let blueGredient = LinearGradient(gradient: Gradient(colors: [.white, .gray]), startPoint: .topLeading, endPoint: .bottomTrailing)
   
   var body: some View {
      ZStack{
         ContainerRelativeShape()
            .fill(number > 5 ? redGredient: blueGredient)
            .ignoresSafeArea()
         
         VStack {
            Spacer()
            VStack {
               Text("\(number)")
               CustomView(number: $number)
               
               Divider()
               
               AnotherView(number: $number)
            }
            Spacer()
            
         }
      }
      .overlay(content: {
         Button {
            showSheet.toggle()
         } label: {
            Image(systemName: "questionmark.message.fill")
               .renderingMode(.original)
               .imageScale(.large)
         }
         .position(x:screenWidth - 30, y:0)
         
      })
      .sheet(isPresented: $showSheet, content: {
         StateBindInfoView()
            .presentationDetents([.large])
               .background(.blue.opacity(0.3))
      })

      .navigationTitle("State & Binding")
      .navigationBarTitleDisplayMode(.large)
      .onAppear
      {
         withAnimation(.easeInOut(duration: 2.0)){
            self.isTransition = true
         }
      }
      
      
   }
}



struct CustomView: View {
   @Binding var number: Int
   var body: some View {
      HStack {
         Button(action: {
            number += 1
         }) {
            
            Text("+")
               .foregroundStyle(.blue)
            
         }
         .buttonStyle(.bordered)
         Button("-") {
            if number > 0 {
               number -= 1
            }
         }
         .buttonStyle(.bordered)
      }
   }
}
struct AnotherView: View {
   @Binding var number: Int
   var body: some View {
      Text("\(number)")
      CustomView(number: $number)
      
   }
}
struct StateBindInfoView: View {
   var body: some View {
      // @State Section
      ScrollView {
         VStack{
            Text("1. @State (For Local State Management)")
               .font(.headline)
               .padding(.horizontal)
            VStack(alignment: .leading, spacing: 8) {
               Text("• SwiftUI owns and manages the state variable.")
               Text("• Used to store simple, local data within a view.")
               Text("• Changes to @State trigger a view redraw.")
               Text("• Ideal for managing UI state like toggles, text input, or counters.")
            }
            .font(.body)
            .padding(.horizontal)
            
            // @Binding Section
            Text("2. @Binding (For Shared State Reference)")
               .font(.headline)
               .padding(.horizontal)
            VStack(alignment: .leading, spacing: 8) {
               Text("• References a @State variable from another view.")
               Text("• Does not own the data; it accesses an external source.")
               Text("• Changes to @Binding update the source @State and trigger redraws.")
               Text("• Ideal for passing state between parent and child views.")
            }
            .font(.body)
            .padding(.horizontal)
            
            // Key Takeaways Table
            Text("Key Takeaways")
               .font(.title2)
               .padding(.horizontal)
               .padding(.top, 8)
            
            // Table-like structure using Grid
            Grid(alignment: .leading, horizontalSpacing: 16, verticalSpacing: 8) {
               GridRow {
                  Text("Feature")
                     .font(.headline)
                     .frame(maxWidth: .infinity, alignment: .leading)
                  Text("@State")
                     .font(.headline)
                     .frame(maxWidth: .infinity, alignment: .leading)
                  Text("@Binding")
                     .font(.headline)
                     .frame(maxWidth: .infinity, alignment: .leading)
               }
               Divider()
               GridRow {
                  Text("Who owns the data?")
                  Text("SwiftUI view")
                  Text("External source (e.g., parent view)")
               }
               GridRow {
                  Text("Purpose?")
                  Text("Local state management")
                  Text("Reference shared state")
               }
               GridRow {
                  Text("Triggers view redraw?")
                  Text("Yes")
                  Text("Yes (updates source)")
               }
               GridRow {
                  Text("Ideal for?")
                  Text("Local UI state (e.g., toggle)")
                  Text("Parent-child data sharing")
               }
            }
            .font(.body)
            .padding(.horizontal)
            .padding(.vertical, 8)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal)
         }
         .padding()
      }
      
   }
}



#Preview {
   StateBindView()
}
