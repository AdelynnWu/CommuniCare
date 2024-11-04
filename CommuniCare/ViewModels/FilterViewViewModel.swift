//
//  FilterViewViewModel.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 7/14/24.
//

import Foundation
import SwiftUI

@MainActor
class FilterViewViewModel: ObservableObject {
    @Published var selectedServices: Set<ClinicalService>
    @Published var selectedLanguages: Set<Language>
    
    init() {
        self.selectedServices = []
        self.selectedLanguages = []
    }
    
    func containsService(clinic: Clinic) -> Bool {
        // convert enum to string
//        let selectedServiceStrings = Set(selectedServices.map { $0.rawValue })
//        
//        print(selectedServiceStrings)
//        return clinic.clinicalServices.contains { service in
//                selectedServiceStrings.contains(service)
//        }
        // Convert selected services to strings for comparison
            let selectedServiceStrings = Set(selectedServices.map { $0.rawValue })
            
            // Check if clinic services match any selected service
            let clinicServicesSet = Set(clinic.clinicalServices)
            let hasMatchingService = !selectedServiceStrings.isDisjoint(with: clinicServicesSet)
            
            print("Selected services: \(selectedServiceStrings), Clinic services: \(clinicServicesSet), Match found: \(hasMatchingService)")
            return hasMatchingService
    }
    
    func containsLanguage(clinic: Clinic) -> Bool {
        // convert enum to string
//        let selectedLanguageStrings = Set(selectedLanguages.map { $0.rawValue })
//        print(selectedLanguageStrings)
//        return clinic.languages.contains { language in
//                selectedLanguageStrings.contains(language)
//        }
        // Convert selected languages to strings for comparison
            let selectedLanguageStrings = Set(selectedLanguages.map { $0.rawValue })
            
            // Check if clinic languages match any selected language
            let clinicLanguagesSet = Set(clinic.languages)
            let hasMatchingLanguage = !selectedLanguageStrings.isDisjoint(with: clinicLanguagesSet)
            
            print("Selected languages: \(selectedLanguageStrings), Clinic languages: \(clinicLanguagesSet), Match found: \(hasMatchingLanguage)")
            return hasMatchingLanguage
    }
}


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

//enum ClinicalService: String, CaseIterable {
//    case hivAndSexualHealth = "HIV and Sexual Health"
//    case birthControlAndSTDTesting = "Birth Control and STD Testing"
//    case immunizations = "Immunization"
//    case substanceAbuseServices = "Substance Abuse Services"
//    case mentalHealthCounseling = "Mental Health Counseling"
//    case covid19Testing = "COVID-19 Testing"
//}

enum ClinicalService: String, CaseIterable {
    case diabetes = "Diabetes"
    case heartDisease = "Heart Disease"
    case asthma = "Asthma"
    case cancer = "Cancer"
    case coopd = "COPD"
}
