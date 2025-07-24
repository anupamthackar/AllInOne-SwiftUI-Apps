//
//  SwiftUIView.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 17/07/25.
//

import SwiftUI


// MARK: - Main View StateObject and ObservedObject
struct StateObjectObservedObject: View {
   let screenWidth: CGFloat = UIScreen.main.bounds.width
   @State var showSheet: Bool = false
   var body: some View {
      ScrollView {
         Example1()
         Divider()
         Example2()
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
         InfoView()
            .presentationDetents([.medium])
      })
      .navigationTitle("StateObject and ObservedObject")
   }
}

// MARK: - Example 2
struct Example2: View {
   @StateObject var vm = CounterViewModel()
   var body: some View {
      VStack(spacing: 24) {
         Text("Main View Counter: \(vm.count)")
            .font(.title)
         CounterView(vm: vm)
         
         HStack(spacing: 24){
            
            IncrementView(vm: vm)
            
            Button("Reset") {
               vm.resetCount()
            }
            .buttonStyle(.borderedProminent)
         }
      }
   }
}

struct CounterView: View {
   @ObservedObject var vm: CounterViewModel
   var body: some View {
      Text("Counter View Count: \(vm.count)")
         .font(.headline)
         .padding()
         .background(Color.gray.opacity(0.2))
         .cornerRadius(10)
      

   }
}

struct IncrementView: View {
   @ObservedObject var vm: CounterViewModel
   var body: some View {
      Button("Increment") {
         vm.incrementCount()
      }
      .buttonStyle(.borderedProminent)
   }
}

// MARK: - Example 1

struct CountIncrementView: View {
   @StateObject var vm = CounterViewModel()
   var body: some View {
      Text("Count: \(vm.count)")
      Button("Increment") {
         vm.incrementCount()
      }
      .buttonStyle(.borderedProminent)
   }
}

struct Example1: View {
   @State var number: Int = 0
   var body: some View {

         VStack {
            Text("Random number: \(number)")
            
            Button("Generate Random Number") {
               number = (0...1000).randomElement() ?? 0
            }
            .buttonStyle(.borderedProminent)
            CountIncrementView()
            
         }
         .padding()
         .background(RoundedRectangle(cornerRadius: 30).stroke(Color.gray, lineWidth: 3))
         
      
   }
}

// MARK: - View Model
final class CounterViewModel: ObservableObject {
   @Published var count = 0
   
   func incrementCount() {
      count += 1
   }
   
   func resetCount() {
      count = 0
   }
}

#Preview {
   StateObjectObservedObject()
}

// MARK: - About it

struct InfoView: View {
    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                // Main description
                Text("In SwiftUI, @StateObject and @ObservedObject are both used to manage observable objects, but they behave differently in terms of lifecycle and ownership:")
                    .font(.body)
                    .padding(.horizontal)

                // @StateObject Section
                Text("1. @StateObject (Recommended for Creating ViewModel)")
                    .font(.headline)
                    .padding(.horizontal)
                VStack(alignment: .leading, spacing: 8) {
                    Text("• SwiftUI owns and manages the lifecycle of the object.")
                    Text("• The instance persists even when the view is recreated.")
                    Text("• Ideal for creating the ViewModel inside a view.")
                }
                .font(.body)
                .padding(.horizontal)

                // @ObservedObject Section
                Text("2. @ObservedObject (For Injecting Existing ViewModel)")
                    .font(.headline)
                    .padding(.horizontal)
                VStack(alignment: .leading, spacing: 8) {
                    Text("• The view does not own the object; it depends on an external source.")
                    Text("• When the view is recreated, a new instance is created, resetting state.")
                    Text("• Ideal for passing an already created object from a parent.")
                    Text("• Screenshot 2025-...")
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
                        Text("@StateObject")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                        Text("@ObservedObject")
                            .font(.headline)
                            .frame(maxWidth: .infinity, alignment: .leading)
                    }
                    Divider()
                    GridRow {
                        Text("Who owns it?")
                        Text("SwiftUI view")
                        Text("External owner (parent)")
                    }
                    GridRow {
                        Text("When is it recreated?")
                        Text("Only on app launch")
                        Text("Whenever the view is recreated")
                    }
                    GridRow {
                        Text("Ideal for?")
                        Text("Creating a new instance of ViewModel")
                        Text("Receiving an instance from parent")
                    }
                    GridRow {
                        Text("Does state persist?")
                        Text("Yes")
                        Text("No (if view is recreated)")
                    }
                }
                .font(.body)
                .padding(.horizontal)
                .padding(.vertical, 8)
                .background(Color(.systemGray6))
                .cornerRadius(8)
                .padding(.horizontal)
            }
            .padding(.vertical)
        }
        .navigationTitle("StateObject vs ObservedObject")
    }
}

