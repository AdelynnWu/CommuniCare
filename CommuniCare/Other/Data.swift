//
//  Data.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 7/14/24.
//

import Foundation
import CoreLocation

var clinicsData: [Clinic] = [
    Clinic(id: "Ithaca Med", clinicalServices: ["Birth Control and STD Testing"], insurance: ["Insurance A", "Insurance B"], languages: ["English", "French"], latitude: 41, longitude: 53, paymentModel: "Medicaid/Medicare", specialtyServices: ["Adult Primary Care", "Women's Health"], walkIn: true, website:
            "www.ithacamed.com", direction: "https://www.google.com/maps/place/IthacaMed/@42.4429777,-76.4994726,15z/data=!4m6!3m5!1s0x89d08183a9848c27:0xeaf73b62bddd4c24!8m2!3d42.4429777!4d-76.4994726!16s%2Fg%2F1tf_tvh5?entry=ttu", address: "123 Ithaca, NY"),
    Clinic(id: "Tompkins County Medical Center", clinicalServices: ["HIV and Sexual Health", "Birth Control and STD Testing"], insurance: ["Insurance A", "Insurance B"], languages: ["English"], latitude: 41, longitude: 53, paymentModel: "Medicaid/Medicare", specialtyServices: ["Adult Primary Care", "Women's Health"], walkIn: true, website:
            "www.ithacamed.com", direction: "https://www.google.com/maps/place/IthacaMed/@42.4429777,-76.4994726,15z/data=!4m6!3m5!1s0x89d08183a9848c27:0xeaf73b62bddd4c24!8m2!3d42.4429777!4d-76.4994726!16s%2Fg%2F1tf_tvh5?entry=ttu", address: "123 Ithaca, NY"),
    Clinic(id: "Ithaca Pediatric Clinic", clinicalServices: ["HIV and Sexual Health", "Birth Control and STD Testing"], insurance: ["Insurance A", "Insurance B"], languages: ["English", "Spanish"], latitude: 41, longitude: 53, paymentModel: "Medicaid/Medicare", specialtyServices: ["Adult Primary Care", "Women's Health"], walkIn: true, website:
            "www.ithacamed.com", direction: "https://www.google.com/maps/place/IthacaMed/@42.4429777,-76.4994726,15z/data=!4m6!3m5!1s0x89d08183a9848c27:0xeaf73b62bddd4c24!8m2!3d42.4429777!4d-76.4994726!16s%2Fg%2F1tf_tvh5?entry=ttu", address: "123 Ithaca, NY"),
    Clinic(id: "YMCA of Ithaca and Tompkins County", clinicalServices: ["Heart disease"], insurance: [], languages: ["English", "Spanish", "Chinese"], latitude: 41, longitude: 53, paymentModel: "$50 for YMCA Members, $75 for non-members (guest passes included). Scholarships are available for YMCA membership and the BPSM program fees.", specialtyServices: [], walkIn: true, website:
            "https://www.ithacaymca.com/bloodpressure", direction: "https://www.ithacaymca.com/bloodpressure", address: "123 Ithaca, NY"),
    Clinic(id: "Cayuga Health Partners", clinicalServices: ["Diabetes"], insurance: [], languages: ["English"], latitude: 41, longitude: 53, paymentModel: "free", specialtyServices: [], walkIn: true, website:
            "n/a", direction: "n/a", address: "123 Ithaca, NY"),
    Clinic(id: "Human Services Coalition of Tompkins County", clinicalServices: ["Heart disease", "Diabetes", "Asthma", "Cancer", "Obesity", "COPD"], insurance: [], languages: ["English"], latitude: 41, longitude: 53, paymentModel: "free", specialtyServices: [], walkIn: true, website:
            "https://hsctc.org/community-health-advocates/", direction: "https://hsctc.org/community-health-advocates/", address: "123 Ithaca, NY"),
    Clinic(id: "Cayuga Center for Health Living", clinicalServices: ["Diabetes"], insurance: [], languages: ["English", "Spanish", "Chinese"], latitude: 41, longitude: 53, paymentModel: "$300 for yearlong program. Not reimburseble through insurance, but may be covered by health savings account.", specialtyServices: [], walkIn: true, website:
            "https://www.cayugamed.org/services-2/wellness/services/", direction: "https://www.cayugamed.org/services-2/wellness/services/", address: "123 Ithaca, NY"),
    Clinic(id: "RX Outreach", clinicalServices: ["Heart disease", "Diabetes", "Asthma", "Cancer", "Obesity", "COPD"], insurance: [], languages: ["English"], latitude: 41, longitude: 53, paymentModel: "Most medication from Rx Outreach is not free, but prices may be significantly less expensive than retail pharmacies", specialtyServices: [], walkIn: true, website:
            "http://rxoutreach.org/", direction: "http://rxoutreach.org/", address: "123 Ithaca, NY"),
]
