   //
   //  Mask.swift
   //  Apple-Frameworks
   //
   //  Created by indianrenters on 16/07/25.
   //
   
   import SwiftUI
   
   struct Mask: View {
         @State private var moveGradientX: Bool = false
         @State var showSheet: Bool = false
         let screenWidth: CGFloat = UIScreen.main.bounds.width
         var body: some View {
               let screenWidth = UIScreen.main.bounds.width
               
               Rectangle()
                  .fill(Color.black)
                     .overlay(
                           LinearGradient(gradient: Gradient(colors: [.clear, .white, .clear]), startPoint: .leading, endPoint: .trailing)
                                 .offset(x:moveGradientX ? -screenWidth/2:  screenWidth/2)
                        )
               
                        .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: moveGradientX)
                           .mask({
                                 Text("Run")
                                    .font(.title).fontWeight(.bold)
                                       .foregroundStyle(.white)
                                 Image(systemName: "figure.run")
                                    .resizable()
                                       .scaledToFit()
                                          .frame(width: 100, height: 100)
                                 Text("sadasdsadsadasd")
                                 
                              })
                              .onAppear {
                                    moveGradientX.toggle()
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
                                          MaskInfoView()
                                             .presentationDetents([.large])
                                                .background(.blue.opacity(0.3))
                                       })
            }
      }
   
   struct MaskInfoView: View {
         var body: some View {
               ScrollView {
                     // Mask Modifier Section
                     Text("1. Mask Modifier (For Custom Clipping)")
                        .font(.headline)
                           .padding(.horizontal)
                     VStack(alignment: .leading, spacing: 8) {
                           Text("• Applies a shape or view as a mask to control the visibility of the target view.")
                           Text("• Only the areas of the target view that overlap with the mask's visible parts are shown.")
                           Text("• The mask can be any SwiftUI view, such as shapes (Circle, Rectangle) or custom views.")
                           Text("• Ideal for creating effects like circular images, custom cutouts, or gradient fades.")
                        }
                        .font(.body)
                           .padding(.horizontal)
                     
                     // Example Usage
                     Text("Example Usage")
                        .font(.headline)
                           .padding(.horizontal)
                     VStack(alignment: .leading, spacing: 8) {
                           Text("• Circular image: Apply a Circle() mask to an Image view.")
                           Text("• Gradient fade: Use a LinearGradient as a mask for a fade effect.")
                           Text("• Custom shape: Use a custom Path or Shape to create unique clipping areas.")
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
                                 Text("Mask Modifier")
                                    .font(.headline)
                                       .frame(maxWidth: .infinity, alignment: .leading)
                              }
                           Divider()
                           GridRow {
                                 Text("Purpose")
                                 Text("Clip a view to a custom shape or view")
                              }
                           GridRow {
                                 Text("Mask Type")
                                 Text("Any SwiftUI view (e.g., Shape, Image, Gradient)")
                              }
                           GridRow {
                                 Text("Visibility")
                                 Text("Only overlapping areas are visible")
                              }
                           GridRow {
                                 Text("Ideal for")
                                 Text("Custom clipping, effects like circular images or fades")
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
      }
   
   #Preview {
         Mask()
      }
