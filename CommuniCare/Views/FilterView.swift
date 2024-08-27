//
//  FilterView.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 7/14/24.
//

import SwiftUI

struct FilterView: View {
    @State private var selectedDistance: Set<Distance> = []
    @State private var selectedLanguage: Set<Language> = []
    @State private var selectedMedicalHistory: Set<MedicalHistory> = []
    @State var resetNavigated = false
    @State var applyNavigated = false
        
        var body: some View {
            NavigationView {
                VStack(alignment: .leading) {
                    // Header
                    HStack {
                        NavigationLink(destination: HomeView(viewModel: HomeViewViewModel()).navigationBarBackButtonHidden(true)){
                            Image(systemName: "chevron.left").foregroundColor(.white)
                        }
                        Spacer()
                        Text("Filter")
                            .font(.title)
                            .foregroundColor(.white)
                            .offset(y: 14)
                        Spacer()
                    }
                    .padding()
                    .background(Color.matchaGreen)
                    
                    // Distance
                    Section(header: Text("Distance Willing to Travel").bold()) {
                        VStack(alignment: .leading) {
                            ForEach(Distance.allCases, id: \.self) { distance in
                                CheckBoxView(isChecked: $selectedDistance, value: distance, text: distance.rawValue)
                            }
                        }.offset(y: -15)
                    }
                    .padding()
                    
                    // Language
//                    Section(header: Text("Language").bold()) {
//                        VStack(alignment: .leading) {
//                            Picker("Language", selection: $selectedLanguage) {
//                                ForEach(["English", "Spanish", "French"], id: \.self) { language in
//                                    Text(language).tag(language)
//                                }
//                            }
//                            .pickerStyle(MenuPickerStyle())
//                            .padding()
//                            .overlay(
//                                RoundedRectangle(cornerRadius:30).stroke(Color.matchaGreen, lineWidth: 1)
//                                    .frame(width: 150, height: 50)
//                            ).offset(x: 10, y: -30)
//                        }
//                    }
                    //.padding()
                    
                    // Medical History
                    Section(header: Text("Language").bold()) {
                        VStack(alignment: .leading) {
                            ForEach(Language.allCases, id: \.self) { language in
                                CheckBoxView(isChecked: $selectedLanguage, value: language, text: language.rawValue)
                            }
                        }
                    }
                    .padding()
                    
                    Spacer()
                    
                    // Buttons
                    HStack {
                        NavigationLink(destination: HomeView(viewModel: HomeViewViewModel()).navigationBarBackButtonHidden(true), isActive: $resetNavigated){
                            Button(action: {
                                // Reset Action
                                selectedDistance.removeAll()
                                selectedLanguage.removeAll()
                                selectedMedicalHistory.removeAll()
                                self.resetNavigated.toggle()
                            }) {
                                Text("Reset")
                                    .foregroundColor(Color.matchaGreen)
                                    .padding()
                                    .overlay(
                                        RoundedRectangle(cornerRadius: 20)
                                            .stroke(Color.matchaGreen, lineWidth: 1)
                                            .frame(width: 100, height: 40)
                                    )
                            }.offset(x: 35)
                        }
                        Spacer()
//                        Button("Apply"){
//                            // apply filter
//                        }.buttonStyle(.borderedProminent)
//                            .tint(Color.matchaGreen)
//                            .cornerRadius(20)
//                            .frame(width: 100, height: 40)
//                            .padding(.horizontal, 50)
//                            .padding(.vertical, 3)
                        
                        
                        NavigationLink(destination: HomeView(viewModel: HomeViewViewModel()).navigationBarBackButtonHidden(true), isActive: $applyNavigated){
                            Button{
                                self.applyNavigated.toggle()
                            } label: {
                                Text("Apply")
                                    .frame(width: 100, height: 40)
                                    .foregroundStyle(.white)
                                    .background(Color.matchaGreen)
                                    .cornerRadius(20)
                            }.offset(x: -20)
                            
                        }
                        
                    }
                    .padding()
                    .background(Color(UIColor.systemGray6))
               }
            }
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
}

#Preview {
    FilterView()
}
