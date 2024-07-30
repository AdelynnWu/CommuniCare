//
//  Clinic.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 6/26/24.
//

import Foundation
import SwiftUI
import CoreLocation

struct Clinic: Identifiable, Codable {
    var id: String
    var clinicalServices: [String] //
    var insurance: [String] //
    var languages: [String] //
    var latitude: Double //
    var longitude: Double //
    var paymentModel: String //
    var specialtyServices: [String] //
    var walkIn: Bool //
    var website: String //
    var direction: String //
    var address: String //
}


