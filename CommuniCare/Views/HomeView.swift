//
//  HomeView.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 6/26/24.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    @ObservedObject var viewModel: HomeViewViewModel
    @EnvironmentObject var authViewModel: AuthViewModel
    @EnvironmentObject var filterViewModel: FilterViewViewModel
    @State private var clinics = clinicsData
    @State private var filteredClinics: [Program] = []
    
//    var filteredClinics: [Clinic] {
//        viewModel.clinics.filter { clinic in
//            // Search filter
//            let matchesSearchText = searchText.isEmpty || clinic.id.localizedCaseInsensitiveContains(searchText)
//            
//            // Service filter: true if no service is selected or clinic matches at least one selected service
//            let matchesService = filterViewModel.selectedServices.isEmpty || filterViewModel.containsService(clinic: clinic)
//            
//            // Language filter: true if no language is selected or clinic matches at least one selected language
//            let matchesLanguage = filterViewModel.selectedLanguages.isEmpty || filterViewModel.containsLanguage(clinic: clinic)
//            
//            if !searchText.isEmpty {
//                       return matchesSearchText
//            }
//            // When search text is empty, apply filtering based on services and languages
//            if filterViewModel.selectedServices.isEmpty && filterViewModel.selectedLanguages.isEmpty {
//                // No filters applied, so show all clinics
//                return true
//            } else if !filterViewModel.selectedServices.isEmpty && filterViewModel.selectedLanguages.isEmpty {
//                // Only selectedServices is not empty, filter by services
//                return matchesService
//            } else if filterViewModel.selectedServices.isEmpty && !filterViewModel.selectedLanguages.isEmpty {
//                // Only selectedLanguages is not empty, filter by languages
//                return matchesLanguage
//            } else {
//                // Both selectedServices and selectedLanguages are not empty, filter by both
//                return matchesService && matchesLanguage
//            }
//        }
//    }
    
        var body: some View {
            NavigationView {
                VStack(spacing: 0) {
                    // Header
                    header

                    VStack {
                        searchBar
                            .padding(.top, 10)
                        Text("Suggested for you")
                            .font(.title2)
                            .bold()
                            .padding(.top, 10)
                            .frame(maxWidth: .infinity, alignment: .leading)
                            .padding(.leading)
                        clinicList
                    }
                    tabBar
                }
                .edgesIgnoringSafeArea([.top, .bottom])
                .task {
//                    await viewModel.fetchClinics()
                    await viewModel.fetchPrograms()
                }
                .onAppear {
                    initializePrograms()
                }
                .onChange(of: filterViewModel.selectedServices) {
                    filterPrograms()
                }
                .onChange(of: filterViewModel.selectedLanguages) {
                    filterPrograms()
                }
                .onChange(of: searchText) {
                    filterPrograms()
                }
            }
            .navigationBarHidden(true)
            .navigationTitle("Programs")
            
        }
    

}

#Preview {
    HomeView(viewModel: HomeViewViewModel())
}

// MARK: Functions
extension HomeView {
    private func initializePrograms() {
        filteredClinics = viewModel.programs
    }
    
    private func filterPrograms() {
        filteredClinics = viewModel.programs.filter { program in
            // Search filter
            var matchesSearchText = false
            if (program.id != nil) {
                matchesSearchText = (searchText.isEmpty || program.id!.localizedCaseInsensitiveContains(searchText))
            }
            
            // Service filter: true if no service is selected or clinic matches at least one selected service
            let matchesService = filterViewModel.selectedServices.isEmpty || filterViewModel.containsService(program: program)
            
            // Language filter: true if no language is selected or clinic matches at least one selected language
            let matchesLanguage = filterViewModel.selectedLanguages.isEmpty || filterViewModel.containsLanguage(program: program)
            
            if !searchText.isEmpty {
                return matchesSearchText
            }
            // When search text is empty, apply filtering based on services and languages
            if filterViewModel.selectedServices.isEmpty && filterViewModel.selectedLanguages.isEmpty {
                // No filters applied, so show all clinics
                return true
            } else if !filterViewModel.selectedServices.isEmpty && filterViewModel.selectedLanguages.isEmpty {
                // Only selectedServices is not empty, filter by services
                return matchesService
            } else if filterViewModel.selectedServices.isEmpty && !filterViewModel.selectedLanguages.isEmpty {
                // Only selectedLanguages is not empty, filter by languages
                return matchesLanguage
            } else {
                // Both selectedServices and selectedLanguages are not empty, filter by both
                return matchesService && matchesLanguage
            }
        }
    }
}

// MARK: Components
extension HomeView {
    private var header: some View {
        ZStack {
            RoundedRectangle(cornerRadius: 15)
                .foregroundStyle(Color.matchaGreen)
            HStack {
                Image(systemName: "leaf.fill")
                    .foregroundColor(Color.darkGreen)
                Text("Welcome back, " + ( authViewModel.currentUser?.email.components(separatedBy: "@")[0] ?? "") + "!")
                    .font(.system(size: 18))
                    .foregroundStyle(Color.white)
                    .bold()
                    .italic()
            }
            .padding(.top, 60)
            .padding(.trailing, 50)

        }
        .frame(width: UIScreen.main.bounds.width, height: 130)
    }
    
    private var searchBar: some View {
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
    }
    
    private var clinicList: some View {
        ScrollView {
            ForEach(filteredPrograms) { program in
                ProgramCard(program: program)
                    .padding(.horizontal)
                    .padding(.bottom, 10)
            }
        }
    }
    private var tabBar: some View {
        ZStack{
            Rectangle().frame(width: UIScreen.main.bounds.width, height: 66)
                .foregroundColor(Color.offwhite)
            HStack {
//                Spacer()
//                NavigationLink(destination: BookmarkClinicsView()){
//                    Image(systemName: "bookmark")
//                        .resizable()
//                        .frame(width: 25, height: 27, alignment: .center)
//                        .foregroundStyle(Color.matchaGreen)
//                }
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
        }
    }
}

// MARK: Functions
extension HomeView {
    var filteredPrograms: [Program] {
        viewModel.programs.filter { program in
            // Search filter
            let matchesSearchText = searchText.isEmpty || ((program.id?.localizedCaseInsensitiveContains(searchText)) != nil)
            
            // Service filter: true if no service is selected or clinic matches at least one selected service
            let matchesService = filterViewModel.selectedServices.isEmpty || filterViewModel.containsService(program: program)
            
            // Language filter: true if no language is selected or clinic matches at least one selected language
            let matchesLanguage = filterViewModel.selectedLanguages.isEmpty || filterViewModel.containsLanguage(program: program)
            
            if !searchText.isEmpty {
                   return matchesSearchText
            }
            // When search text is empty, apply filtering based on services and languages
            if filterViewModel.selectedServices.isEmpty && filterViewModel.selectedLanguages.isEmpty {
                // No filters applied, so show all clinics
                return true
            } else if !filterViewModel.selectedServices.isEmpty && filterViewModel.selectedLanguages.isEmpty {
                // Only selectedServices is not empty, filter by services
                return matchesService
            } else if filterViewModel.selectedServices.isEmpty && !filterViewModel.selectedLanguages.isEmpty {
                // Only selectedLanguages is not empty, filter by languages
                return matchesLanguage
            } else {
                // Both selectedServices and selectedLanguages are not empty, filter by both
                return matchesService && matchesLanguage
            }
        }
    }
}
