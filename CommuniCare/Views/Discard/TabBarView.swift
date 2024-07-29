//
//  TabBarView.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 7/19/24.
//

import SwiftUI

struct TabBarView: View {
    var body: some View {
        TabView{
            
            BookmarkClinicsView().navigationBarBackButtonHidden(true)
            .tabItem {
                Label("Bookmark", image: "bookmarkIcon")
            }
            
            NavigationStack{
                HomeView().navigationBarBackButtonHidden(true)
            }.tabItem {
                Label("Home", image: "homeIcon")
            }
            
            
            ProfileView().navigationBarBackButtonHidden(true)
            .tabItem {
                Label("Home", image: "profileIcon")
            }
        }
    }
}

#Preview {
    TabBarView()
}
