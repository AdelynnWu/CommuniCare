//
//  RegisterViewViewModel.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 6/26/24.
//

import Foundation
import FirebaseAuth
import FirebaseFirestore

class RegisterViewViewModel: ObservableObject {
    @Published var email = ""
    @Published var password = ""
    @Published var lastName = ""
    @Published var firstName = ""
    @Published var age = 0
    @Published var sex = ""
    @Published var address = ""
    @Published var city = ""
    @Published var state = ""
    @Published var zip = ""
    @Published var insurance = ""
    @Published var policy = ""
    
    init() {}
    
    func register() {
        guard validate() else {
            print("invalidate")
            return
        }
        Auth.auth().createUser(withEmail: email, password: password) { [weak self] result, error in
            guard let userId = result?.user.uid else {
                print(error?.localizedDescription)
                print("user id issue")
                return
            }
            self?.insertUserRecord(id: userId)
        }
    }
    
    private func insertUserRecord(id: String) {
        let newUser = User(id: id, email: email, lastName: lastName, firstName: firstName, age: age, sex: sex, address: address, city: city, state: state, zipCode: zip, insurance: insurance, policy: policy)
        
        let db = Firestore.firestore()
        
        db.collection("users")
            .document(id)
            .setData(newUser.asDictionary())
        print("inserted user record")
    }
    
    private func validate() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !lastName.trimmingCharacters(in: .whitespaces).isEmpty else {
            print("email, pw, name")
            return false
        }
        
        
        guard email.contains("@"), email.contains(".") else {
            print("email")
            return false
        }
        
        guard password.count >= 8 else {
            print("pw")
            return false
        }
        
        return true
    }
}