//
//  AuthViewModel.swift
//  Apple-Frameworks
//
//  Created by indianrenters on 21/07/25.
//

import Foundation
import FirebaseAuth // Auth
import FirebaseFirestore // Storage

@MainActor
final class AuthViewModel: ObservableObject {

   @Published var userSession: FirebaseAuth.User?
   @Published var currentUser: User?
   @Published var isError: Bool = false

   private let auth = Auth.auth()
   private let firestore = Firestore.firestore()

   init() {
      Task {
         await loadCurrnetUser()
      }
   }

   func resetPassword(by email: String) async {
      do {
         try await auth.sendPasswordReset(withEmail: email)
      } catch {
         isError = true
      }
   }

   private func deleteUser(by uid: String) {
      firestore.collection("users").document(uid).delete()
   }

   func deleteAccount() async {
      do {
         userSession = nil
         currentUser = nil
         deleteUser(by: auth.currentUser?.uid ?? "")
         try await auth.currentUser?.delete()

      } catch {
         isError = true
      }
   }

   func loadCurrnetUser() async {
      if let user = auth.currentUser {
         userSession = user
         await fetchUser(by: user.uid)
      }
   }

   func signOut() {
      do {
         try auth.signOut()
         userSession = nil
         currentUser = nil
         print("✋🏻 Signout Successfully")
      } catch {
         isError = true
      }
   }

   func login(with email: String, password: String) async {
      do {
         let authResult = try await auth.signIn(
            withEmail: email,
            password: password
         )
         userSession = authResult.user
         await fetchUser(by: authResult.user.uid)
         print("🧍🏻 Current User: \(String(describing: currentUser))")
      } catch {
         isError = true
      }
   }

   func fetchUser(by uid: String) async {
      do {
         let document = try await firestore.collection("users").document(uid).getDocument()
         currentUser = try document.data(as: User.self)
      } catch {
         isError = true
      }
   }

   func createUser(with email: String,fullName: String, password: String) async {
      do {
         // auth user entry kar rahe ho
         let authResult = try await auth.createUser(
            withEmail: email,
            password: password
         )
         print("📮 Auth response: User ID: \(authResult.user.uid), Email: \(authResult.user.email ?? "No email")")

         // database user ki extra details store kar rahe ho
         await storeUserInFirestore(
            uid: authResult.user.uid,
            email: email,
            fullName: fullName
         )

      } catch {
         isError = true
      }
   }

   func storeUserInFirestore(uid: String, email: String, fullName: String) async {
      let user = User(id: uid, email: email, fullName: fullName)
      do {
         try firestore.collection("users").document(uid).setData(from: user)
      } catch {
         isError = true
      }
   }

}
