   import SwiftUI
   
   struct EOHomeView: View {
         @StateObject var cartStore = EOCartManager()
         @State var showCart: Bool = false
         var body: some View {
               NavigationStack {
                     ScrollView {
                           EOMainView(cartStore: cartStore)
                              .padding()
                        }
                  }
                  .navigationDestination(isPresented: $showCart) {
                        EOCartView()
                           .environmentObject(cartStore)
                     }
                     
                     .navigationTitle("Product \(cartStore.cartItems.count)")
                        .navigationBarTitleDisplayMode(.large)
                           .toolbar {
                                 ToolbarItem(placement: .topBarTrailing) {
                                       Button{
                                             showCart = true
                                          } label: {
                                                Image(systemName: "cart.fill")
                                                   .imageScale(.medium)
                                             }
                                    }
                              }
            }
      }
   
   // MARK: - Main View
   struct EOMainView: View {
         @State var cartStore: EOCartManager
         @State var productName: String = ""
         @State var productCost: String = ""
         
         var body: some View {
               VStack(spacing: 24) {
                     TextField("Product Name", text: $productName)
                        .textFieldStyle(.roundedBorder)
                     TextField("Product Cost", text: $productCost)
                        .textFieldStyle(.roundedBorder)
                     Button {
                           if !productName.isEmpty && !productCost.isEmpty {
                                 cartStore.addToCart(product: EOCart(productName: productName, productCost: Double(productCost) ?? 0))
                                 productName = ""
                                 productCost = ""
                              }
                        } label: {
                              Text("Add To Cart")
                           }
                           .onSubmit {
                                 productName = ""
                                 productCost = ""
                              }
                  }
            }
      }
   
   // MARK: - Cart View
   struct EOCartView: View {
         @EnvironmentObject var cartStore: EOCartManager
         @State var showSample: Bool = false
         var body: some View {
               Section {
                     if cartStore.cartItems.count > 0{
                           List {
                                 ForEach(cartStore.cartItems.indices, id: \.self) { index in
                                       let item = cartStore.cartItems[index]
                                       HStack {
                                             Text(item.productName)
                                             Spacer()
                                             Text("\(item.productCost)")
                                          }
                                    }
                                    .onDelete(perform: cartStore.removeFromCart)
                              }
                        } else {
                              VStack{
                                    Spacer()
                                    Image(systemName: "archivebox")
                                       .resizable()
                                          .frame(width: 100, height: 100)
                                             .scaledToFit()
                                                .foregroundStyle(.gray)
                                    Text("Add Products to Cart")
                                    Spacer()
                              }
                           }
               }
                  .sheet(isPresented: $showSample) {
                           EPSampleView()
                              .environmentObject(cartStore)
                        }
                  .navigationTitle("Cart")
                     .toolbar {
                              ToolbarItem(placement: .topBarTrailing) {
                                    Button{
                                          showSample = true
                                       } label: {
                                             Image(systemName: "cart.fill")
                                                .imageScale(.medium)
                                          }
                                 }
                           }
            }
      }
   
   // MARK: - Cart
   struct EOCart {
         let productName: String
         let productCost: Double
      }
   
   // MARK: - Cart Manager
   final class EOCartManager: ObservableObject {
         @Published var title: String = "Cart"
         @Published var cartItems: [EOCart] = []
         
         func addToCart(product: EOCart) {
               cartItems.append(EOCart(productName: product.productName, productCost: product.productCost))
            }
         
         func removeFromCart(at index: IndexSet) {
               cartItems.remove(atOffsets: index)
            }
      }
   
   struct EPSampleView: View {
         @EnvironmentObject var cartStore: EOCartManager
         var body: some View {
               Text(cartStore.title)
            }
      }
   #Preview {
         EOHomeView()
      }
