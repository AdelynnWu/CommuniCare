//
//  AuthViewModel.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 7/26/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

protocol RegistrationFormProtocol {
    var form1IsValid: Bool { get }
    var form2IsValid: Bool { get }
    var form3IsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    @Published var userSession: FirebaseAuth.User?
    @Published var currentUser: User?
    
    init() {
        self.userSession = Auth.auth().currentUser //check if there's a user logged in when initializing the app
        
        Task {
            await fetchUser()
        }
    }
    
    func signIn(withEmail email: String, password: String) async throws {
//        print("sign in")
        do {
            print("log in")
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, firstName: String, lastName: String, age: Int, sex: String, insurance: String, policy: String, address: String, city: String, state: String, zipCode: String) async throws {
//        print("create user")
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, email: email, lastName: lastName, firstName: firstName, age: age, sex: sex, address: address, city: city, state: state, zipCode: zipCode, insurance: insurance, policy: policy)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut() // signs out user on backend
            self.userSession = nil // wipes out user session, back to the startView
            self.currentUser = nil // wipes out current user data model
        } catch {
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() {
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else {return}
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else {
//            print("failed to get")
            return
        }
//        print(snapshot.data().map(String.init(describing:)))
        self.currentUser = try? snapshot.data(as: User.self)
        print("DEBUG: Current user is \(String(describing: self.currentUser))")
    }
}
