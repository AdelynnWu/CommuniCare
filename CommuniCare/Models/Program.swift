//
//  Program.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 11/26/24.
//
import SwiftUI
import Foundation
import FirebaseFirestore

struct Program: Identifiable, Codable {
    @DocumentID var id: String? // Maps to Firestore's document ID
    var services: [String]
    var website: String
    var paymentModel: String
    var clinic: String
    var location: [Double]
    var languages: [String]
}
