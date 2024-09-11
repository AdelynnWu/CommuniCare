//
//  LoginView.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 6/26/24.
//

import SwiftUI

struct LoginView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    @State private var email = ""
    @State private var password = ""
    
    
    var body: some View {
        VStack {
            
                Spacer().frame(height: 0)
                
                Image(.logo).resizable().frame(width: 135/4, height: 205/4)
                    .frame(alignment: .center)
                    .offset(y: -200)
                
            VStack {
                Text("Log In")
                    .font(.system(size: 35))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.darkGreen)
                    .padding(.leading, 28)
                    .offset(y: -35)
            
                InputView(text: $email, title: "Username", placeholder: "ex. john123").autocapitalization(.none)
                
                InputView(text: $password, title: "Password", placeholder: "Enter your password", isSucureField: true).padding(.top, 10)
                
            }.padding(.horizontal)
            .offset(y: -145)
            
            // log in button
            LargeButton(title: "Log In", backgroundColor: Color.darkGreen) {
                Task {
                    try await viewModel.signIn(withEmail: email, password: password)
                }
            }.disabled(!formIsValid)
            .opacity(formIsValid ? 1.0 : 0.5)
            
        }.offset(y: 40)
        
    }
}

#Preview {
    LoginView()
}


// MARK: AuthenticationFormProtocol
extension LoginView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !password.isEmpty && password.count > 5
//        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 5
    }
}
