//
//  User.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 6/26/24.
//

import Foundation

struct User: Identifiable, Codable {
    let id: String
    let email: String
    let gender: String
    let insuranceStatus: String
    let policyName: String
    let service: [String]
    
//    var initials: String {
//        let formatter = PersonNameComponentsFormatter()
//        if let components = formatter.personNameComponents(from: firstName + " " + lastName) {
//            formatter.style = .abbreviated
//            return formatter.string(from: components)
//        }
//        return ""
//    }
}

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, email: "april123@gmail.com", gender: "Female", insuranceStatus: "None", policyName: "None", service: [""])
}
