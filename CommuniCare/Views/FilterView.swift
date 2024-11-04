//
//  FilterView.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 7/14/24.
//

import SwiftUI

struct FilterView: View {
    @EnvironmentObject var viewModel: FilterViewViewModel
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
                    Section(header: Text("Clinical Services Provided").bold()) {
                        VStack(alignment: .leading) {
                            ForEach(ClinicalService.allCases, id: \.self) { service in
                                CheckBoxView(isChecked: $viewModel.selectedServices, value: service, text: service.rawValue)
                            }
                        }.offset(y: -15)
                    }
                    .padding()
                    
                    // Lznguage
                    Section(header: Text("Language").bold()) {
                        VStack(alignment: .leading) {
                            ForEach(Language.allCases, id: \.self) { language in
                                CheckBoxView(isChecked: $viewModel.selectedLanguages, value: language, text: language.rawValue)
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
                                viewModel.selectedServices.removeAll()
                                viewModel.selectedLanguages.removeAll()
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
