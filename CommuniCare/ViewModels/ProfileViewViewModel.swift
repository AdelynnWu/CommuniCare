//
//  ProfileViewViewModel.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 6/26/24.
//

import Foundation
import SwiftUI
import FirebaseAuth
import FirebaseFirestore

class ProfileViewViewModel: ObservableObject {
    init() {}
    
    @Published var user: User? = nil
    
    func fetchUser() {
        guard let userId = Auth.auth().currentUser?.uid else {
            print("failed to load user id")
            return
        }
        let db = Firestore.firestore()
        db.collection("users").document(userId).getDocument { [weak self] snapshot, error in
            guard let data = snapshot?.data(), error == nil else {
                return
            }
            DispatchQueue.main.async {
                // since assigning a new user will trigger a view refresh
                self?.user = User(id: data["id"] as? String ?? "",
                                  email: data["email"] as? String ?? "",
                                  gender: data["gender"] as? String ?? "",
                                  insuranceStatus: data["insuranceStatus"] as? String ?? "",
                                  policyName: data["policyName"] as? String ?? "",
                                  service: data["service"] as? [String] ?? [""])
            }

        }
        
    }
    
    func logOut() {
        do {
            try Auth.auth().signOut()
        } catch {
            print(error.localizedDescription)
        }
    }
}


struct SettingsRow: View {
    var iconName: String
    var text: String
    
    var body: some View {
        HStack {
            Image(systemName: iconName)
                .foregroundColor(.black)
            Text(text)
                .foregroundColor(.black)
            Spacer()
        }
        .padding(.vertical, 10)
    }
}
