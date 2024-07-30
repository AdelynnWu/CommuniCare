//
//  ContentView.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 6/26/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                HomeView(viewModel: HomeViewViewModel())
            } else {
                StartView()
            }
        }
    }
}

#Preview {
    ContentView()
}
