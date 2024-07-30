//
//  Data.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 7/14/24.
//

import Foundation
import CoreLocation

var clinicsData: [Clinic] = [
    Clinic(id: "Ithaca Med", clinicalServices: ["HIV and Sexual Health", "Birth Control and STD Testing"], insurance: ["Insurance A", "Insurance B"], languages: ["English", "French"], latitude: 41, longitude: 53, paymentModel: "Medicaid/Medicare", specialtyServices: ["Adult Primary Care", "Women's Health"], walkIn: true, website:
            "www.ithacamed.com", direction: "https://www.google.com/maps/place/IthacaMed/@42.4429777,-76.4994726,15z/data=!4m6!3m5!1s0x89d08183a9848c27:0xeaf73b62bddd4c24!8m2!3d42.4429777!4d-76.4994726!16s%2Fg%2F1tf_tvh5?entry=ttu", address: "123 Ithaca, NY"),
    Clinic(id: "Tompkins County Medical Center", clinicalServices: ["HIV and Sexual Health", "Birth Control and STD Testing"], insurance: ["Insurance A", "Insurance B"], languages: ["English"], latitude: 41, longitude: 53, paymentModel: "Medicaid/Medicare", specialtyServices: ["Adult Primary Care", "Women's Health"], walkIn: true, website:
            "www.ithacamed.com", direction: "https://www.google.com/maps/place/IthacaMed/@42.4429777,-76.4994726,15z/data=!4m6!3m5!1s0x89d08183a9848c27:0xeaf73b62bddd4c24!8m2!3d42.4429777!4d-76.4994726!16s%2Fg%2F1tf_tvh5?entry=ttu", address: "123 Ithaca, NY"),
    Clinic(id: "Ithaca Pediatric Clinic", clinicalServices: ["HIV and Sexual Health", "Birth Control and STD Testing"], insurance: ["Insurance A", "Insurance B"], languages: ["English", "Spanish"], latitude: 41, longitude: 53, paymentModel: "Medicaid/Medicare", specialtyServices: ["Adult Primary Care", "Women's Health"], walkIn: true, website:
            "www.ithacamed.com", direction: "https://www.google.com/maps/place/IthacaMed/@42.4429777,-76.4994726,15z/data=!4m6!3m5!1s0x89d08183a9848c27:0xeaf73b62bddd4c24!8m2!3d42.4429777!4d-76.4994726!16s%2Fg%2F1tf_tvh5?entry=ttu", address: "123 Ithaca, NY")
]
