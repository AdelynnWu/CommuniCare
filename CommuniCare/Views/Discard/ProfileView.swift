//
//  ProfileView.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 6/26/24.
//

import SwiftUI

struct ProfileView: View {
    @StateObject var viewModel = ProfileViewViewModel()
    @AppStorage("signed_in") var currentUserSignedIn: Bool = true
    @AppStorage("email") var userEmail: String?
    @AppStorage("firstName") var userFirstName: String?
    @AppStorage("lastName") var userLastName: String?
    @AppStorage("password") var userPassword: String?
    @AppStorage("age") var userAge: Int?
    @AppStorage("gender") var userGender: String?
    @AppStorage("insurance") var userInsurance: String?
    @AppStorage("policy") var userPolicy: String?
    @AppStorage("distance") var userDistance: String?
    @AppStorage("address") var userAddress: String?
    @AppStorage("city") var userCity: String?
    @AppStorage("state") var userState: String?
    @AppStorage("zip_code") var userZipCode: String?
    
    var body: some View {
        NavigationView {
                    VStack {
                        userProfile
                        Divider()
                            .padding(.horizontal)
                        // Menu Options
                        menu
                        logOutButton
                        Spacer()
                        bottomToolBar
                    }
                    .navigationBarHidden(true)
        }
//       .onAppear {
//            viewModel.fetchUser()
//        }
    }
    
    func logOut() {
        userEmail = nil
        userFirstName = nil
        userLastName = nil
        userPassword = nil
        userAge = nil
        userGender = nil
        userInsurance = nil
        userPolicy = nil
        userAddress = nil
        userCity = nil
        userState = nil
        userZipCode = nil
        
        withAnimation(.spring()) {
            currentUserSignedIn = false
        }
    }
    
}

#Preview {
    ProfileView()
}

extension ProfileView {
    private var logOutButton: some View {
        Text("Log Out")
            .foregroundStyle(Color.white)
            .font(.headline)
            .frame(width: 200, height: 45)
            .background(Color.darkGreen)
            .cornerRadius(22.5)
            .onTapGesture {
                logOut()
            }
    }
    
    private var userProfile: some View {
        HStack {
            Image(systemName: "person.circle")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .foregroundColor(.gray.opacity(0.5))
                .frame(width: 80, height: 80)
                
            
            VStack(alignment: .leading) {
//                                    Text(user.firstName + " " + user.lastName)
                Text((userFirstName ?? "April") + " " + (userLastName ?? "Simpson"))
                    .font(.title)
                    .bold()
                Text(userEmail ?? "april123@gmail.com")
                    .foregroundColor(.gray)
            }
            Spacer()
        }
        .offset(x: 10)
        .padding()
    }
    
    private var menu: some View {
        List {
            NavigationLink(destination: AccountView()) {
                SettingsRow(iconName: "person.fill", text: "Account")
            }
            NavigationLink(destination: NotificationView()) {
                SettingsRow(iconName: "bell.fill", text: "Notifications")
            }
            NavigationLink(destination: SecurityPrivacyView()) {
                SettingsRow(iconName: "shield.checkerboard", text: "Security & privacy")
            }
            NavigationLink(destination: HelpCenterView()) {
                SettingsRow(iconName: "questionmark.circle", text: "Help Center")
            }

        }
        .listStyle(InsetGroupedListStyle())
    }
    
    private var logOutButtonOldVer: some View {
        Button {
//                                viewModel.logOut()
            currentUserSignedIn = false
        } label : {
            Text("Log Out").padding()
                .font(.headline)
                .foregroundColor(.white)
        }
        .frame(width: UIScreen.main.bounds.width)
        .padding(.horizontal, -50)
        .background(Color.darkGreen)
        .clipShape(Capsule())
        .padding()
    }
    
    private var structureOldVer: some View {
        VStack {
            if let user = viewModel.user {
                // Profile Picture and Info
                userProfile
                Divider()
                    .padding(.horizontal)

                // Menu Options
                menu
                logOutButton
                
                Spacer()
                
                // Bottom Tab Bar
            } else {
            // loading profile & log out button
                
            }
        }
    }
    
    private var bottomToolBar: some View {
        ZStack{
            Rectangle().frame(width: UIScreen.main.bounds.width, height: 66)
                .foregroundColor(Color.offwhite)
                
            HStack {
                Spacer()
                NavigationLink(destination: BookmarkClinicsView()){
                    Image(systemName: "bookmark")
                        .resizable()
                        .frame(width: 30, height: 32, alignment: .center)
                        .foregroundStyle(Color.matchaGreen)
                }
                Spacer()
                NavigationLink(destination: HomeView(viewModel: HomeViewViewModel()).navigationBarBackButtonHidden(true)){
                    Image(systemName: "house")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: .center)
                        .foregroundStyle(Color.matchaGreen)
                }
                Spacer()
                NavigationLink(destination: ProfileView().navigationBarBackButtonHidden(true)){
                    Image(systemName: "person")
                        .resizable()
                        .frame(width: 32, height: 32, alignment: .center)
                        .foregroundStyle(Color.matchaGreen)
                }
                Spacer()
            }
        }.offset(y: 37)

    }
}
