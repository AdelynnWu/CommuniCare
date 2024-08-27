//
//  HomeView.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 6/26/24.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    @State private var clinics = clinicsData
    @ObservedObject var viewModel: HomeViewViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    
        var body: some View {
            NavigationView {
                VStack {
                    // Header
                    ZStack {
                        RoundedRectangle(cornerRadius: 15)
                            .foregroundStyle(Color.matchaGreen)
                        HStack {
                            Image(systemName: "leaf.fill")
                                .foregroundColor(Color.darkGreen)
                            Text("Welcome back, " + ( authViewModel.currentUser?.firstName ?? "") + "!")
                                .font(.system(size: 18))
                                .foregroundStyle(Color.white)
                                .bold()
                                .italic()
                        }
                        .padding(.top, 60)
                        .offset(x: -60)
                    }.frame(width: UIScreen.main.bounds.width, height: 150)
                        .offset(y: -80)

                    // Search Bar
                    HStack {
                        TextField("Find a clinic...", text: $searchText)
                            .padding(.leading, 8)
                        NavigationLink(destination: FilterView()){
                            Image(systemName: "line.horizontal.3.decrease.circle")
                                .foregroundColor(.gray)
                                .padding(.trailing, 8)
                        }
                    }
                    .padding()
                    .background(Color(UIColor.systemGray6))
                    .cornerRadius(10)
                    .padding(.horizontal)
                    .offset(y: -70)
                    
                    // Suggested for you
                    Text("Suggested for you")
                        .font(.title2)
                        .bold()
                        .padding(.vertical)
                        .padding(.leading)
                        .padding(.top, 10)
                        .offset(x: -83, y: -70)
//                        .padding(.bottom, 15)

                    
                    // Clinics List
                    ScrollView {
                        ForEach(viewModel.clinics) { clinic in
                            ClinicCard(clinic: clinic)
                                .padding(.horizontal)
                                .padding(.bottom, 10)
                        }
                    }.offset(y: -50)
                    
                    // Bottom Tab Bar
                    ZStack{
                        Rectangle().frame(width: UIScreen.main.bounds.width, height: 66)
                            .foregroundColor(Color.offwhite)
                        HStack {
                            Spacer()
                            NavigationLink(destination: BookmarkClinicsView()){
                                Image(systemName: "bookmark")
                                    .resizable()
                                    .frame(width: 25, height: 27, alignment: .center)
                                    .foregroundStyle(Color.matchaGreen)
                            }
                            Spacer()
                            NavigationLink(destination: HomeView(viewModel: HomeViewViewModel()).navigationBarBackButtonHidden(true)){
                                Image(systemName: "house")
                                    .resizable()
                                    .frame(width: 27, height: 27, alignment: .center)
                                    .foregroundStyle(Color.matchaGreen)
                            }
                            Spacer()
                            NavigationLink(destination: UserProfileView().navigationBarBackButtonHidden(true)){
                                Image(systemName: "person")
                                    .resizable()
                                    .frame(width: 27, height: 27, alignment: .center)
                                    .foregroundStyle(Color.matchaGreen)
                                
                            }
                            Spacer()
                        }
                    }.offset(y: 35)
                }
                .navigationBarHidden(true)
            }
        }
}

#Preview {
    HomeView(viewModel: HomeViewViewModel())
}
