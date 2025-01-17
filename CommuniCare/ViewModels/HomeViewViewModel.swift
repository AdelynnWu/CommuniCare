//
//  HomeViewViewModel.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 6/26/24.
//

import Foundation
import SwiftUI
import Firebase
import FirebaseFirestore

// fetch clinic data from database
@MainActor
class HomeViewViewModel: ObservableObject {
    
    @Published var clinics: [Clinic] = []
    @Published var searchResults: [Clinic] = []
    @Published var programs: [Program] = []
    
    init() {
        Task {
            await fetchClinics()
            await fetchPrograms()
        }
    }
    
    func fetchClinics() async {
        do {
            guard let querySnapshot = try? await Firestore.firestore().collection("clinics").getDocuments() else {
                print("Failed to fetch the collection")
                return
            }
            
            for document in querySnapshot.documents {
                // print(document.data().map(String.init(describing:)))
                self.clinics.append(try document.data(as: Clinic.self))
            }
        } catch {
            print("DEBUG: Failed to fetch clinic data \(error.localizedDescription)")
        }
    }
    
    func fetchPrograms() async {
        do {
            guard let querySnapshot = try? await Firestore.firestore().collection("programs").getDocuments() else {
                print("Filed to fetch programs")
                return
            }
            for document in querySnapshot.documents {
                if let program = try? document.data(as: Program.self) {
                    self.programs.append(program)
                } else {
                    print("Failed to decode Program: \(document.data())")
                }
            }
        }
    }
    
    func searchClinicByName(clinicName name: String) async throws {
        let endpoint = "https://deployed-url/api/clinics/userID=:\(name)"
        guard let url = URL(string: endpoint) else {
            throw ClinicError.invalidURL
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let response = response as? HTTPURLResponse, response.statusCode == 200 else {
            throw ClinicError.invalidResponse
        }
        
        do {
            let decoder = JSONDecoder()
            let result = try decoder.decode(Clinic.self, from: data)
//            self.searchResults.removeAll()
            self.searchResults.append(result)
        } catch {
            throw ClinicError.invalidData
        }
        
        
    }
    
    func getDirection(latitude: Double, longitude: Double) {
        let urlString = "https://www.google.com/maps?q=\(latitude),\(longitude)"
        if let url = URL(string: urlString) {
            if UIApplication.shared.canOpenURL(url) {
                UIApplication.shared.open(url, options: [:], completionHandler: nil)
            }
        } else {
            print("Google Maps URL cannot be opened.")
        }
    }
}


struct ClinicCard: View {
    @Environment(\.openURL) var openURL
    var clinic: Clinic
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // Clinic Logo
                Rectangle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 80, height: 80)
                    .overlay(
                        Text("clinic logo")
                            .foregroundColor(.white)
                    )
                VStack(alignment: .leading) {
                    // Clinic Name and Distance
                    Text(clinic.id)
                        .font(.headline)
                    HStack {
                        Image(systemName: "location.fill")
                        Text(clinic.address)
                    }
                    .foregroundColor(.gray)
                    // TODO: implement distance from you
                    
                    // Action Buttons
                    HStack {
                        Button(action: {
                            // Action for Get Direction
                            openURL(URL(string: clinic.direction)!)
                        }) {
                            Text("Get Direction")
                                .font(.system(size: 15))
                                .foregroundColor(Color.matchaGreen)
                                .padding(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.matchaGreen, lineWidth: 1)
                                )
                        }
                        Button(action: {
                            // Action for Visit Site
                            openURL(URL(string: clinic.website)!)
                        }) {
                            Text("Visit Site")
                                .font(.system(size: 15))
                                .foregroundColor(Color.matchaGreen)
                                .padding(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.matchaGreen, lineWidth: 1)
                                )
                        }
                    }
                }
                Spacer()
            }
            .padding()
            
            // payment method
            Text("Payment Method")
                .bold()
                .padding(.bottom, 1)
                .offset(x: 16)
            Text(clinic.paymentModel)
                .padding(.bottom, 5)
                .offset(x: 16)
            
            // Services
            Text("Services")
                .bold()
                .padding(.bottom, 1)
                .offset(x: 16)
            ForEach(clinic.clinicalServices.prefix(3), id: \.self) { service in
                    Text("• \(service)")
            }
            .padding(.bottom, 5)
            .offset(x: 16)
            
            // More details
//            HStack {
//                Spacer()
//                Button(action: {
//                    // Action for More details
//                }) {
//                    Text("More details")
//                        .foregroundColor(.gray)
//                }
//            }
//            .padding(.horizontal)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}

struct ProgramCard: View {
    @Environment(\.openURL) var openURL
    var program: Program
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                // Clinic Logo
                Rectangle()
                    .fill(Color.gray.opacity(0.5))
                    .frame(width: 80, height: 80)
                    .overlay(
                        Text("clinic logo")
                            .foregroundColor(.white)
                    )
                VStack(alignment: .leading) {
                    // Clinic Name and Distance
                    Text(program.id ?? "N/A")
                        .font(.headline)
                    HStack {
                        Image(systemName: "location.fill")
                        Text(program.clinic)
                    }
                    .foregroundColor(.gray)
                    // TODO: implement distance from you
                    
                    // Action Buttons
                    HStack {
                        Button(action: {
                            // Action for Get Direction
                            if let directionUrl = URL(string: "https://www.google.com/maps?q=\(program.location[0]),\(program.location[1])") {
                                openURL(directionUrl)
                            }
                        }) {
                            Text("Get Direction")
                                .font(.system(size: 15))
                                .foregroundColor(Color.matchaGreen)
                                .padding(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.matchaGreen, lineWidth: 1)
                                )
                        }
                        Button(action: {
                            // Action for Visit Site
                            openURL(URL(string: program.website)!)
                        }) {
                            Text("Visit Site")
                                .font(.system(size: 15))
                                .foregroundColor(Color.matchaGreen)
                                .padding(5)
                                .overlay(
                                    RoundedRectangle(cornerRadius: 10)
                                        .stroke(Color.matchaGreen, lineWidth: 1)
                                )
                        }
                    }
                }
                Spacer()
            }
            .padding()
            
            // payment method
            Text("Payment Method")
                .bold()
                .padding(.bottom, 1)
                .offset(x: 16)
            Text(program.paymentModel)
                .padding(.bottom, 5)
                .offset(x: 16)
            
            // Services
            Text("Services")
                .bold()
                .padding(.bottom, 1)
                .offset(x: 16)
            ForEach(program.services.prefix(3), id: \.self) { service in
                    Text("• \(service)")
            }
            .padding(.bottom, 5)
            .offset(x: 16)
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(color: Color.gray.opacity(0.2), radius: 5, x: 0, y: 5)
    }
}

enum ClinicError:Error {
    case invalidURL
    case invalidResponse
    case invalidData
}
