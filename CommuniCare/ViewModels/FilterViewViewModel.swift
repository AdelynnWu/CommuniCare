//
//  FilterViewViewModel.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 7/14/24.
//

import Foundation

enum Distance: String, CaseIterable {
    case lessThanFiveMile = "5 miles"
    case fiveToTenMiles = "10 miles"
    case tenToFifteenMiles = "15 miles"
    case moreThanTwentyMiles = "20+ miles"
}

enum MedicalHistory: String, CaseIterable {
    case cardiovascularDisease = "Cardiovascular disease"
    case hypertension = "Hypertension"
    case diabetes = "Diabetes"
    case kidneyDisease = "Kidney Disease"
    case obesity = "Obesity"
}

enum Language: String, CaseIterable {
    case english = "English"
    case spanish = "Spanish"
    case madarin = "Mandarin"
    case others = "Others"
}
