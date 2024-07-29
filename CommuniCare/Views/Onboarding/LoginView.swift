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
            
                InputView(text: $email, title: "Email", placeholder: "ex. abc123@gmail.com").autocapitalization(.none)
                
                InputView(text: $password, title: "Password", placeholder: "Enter your password", isSucureField: true).padding(.top, 10)
                
//            Text("Email")
//                .font(.system(size: 15))
//                .multilineTextAlignment(.leading)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding(.leading, 15)
//                .padding(.leading, 15)
//            
//            Spacer().frame(maxHeight: 0)
//            
//            TextField("ex. abc123@gmail.com", text: $viewModel.email)
//                .autocapitalization(.none)
//                .padding()
//                .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
//                .padding()
            
//            Text("Password")
//                .font(.system(size: 15))
//                .multilineTextAlignment(.leading)
//                .frame(maxWidth: .infinity, alignment: .leading)
//                .padding(.leading, 15)
//                .padding(.leading, 15)
//            
//            Spacer().frame(maxHeight: 0)
//            
//            SecureField("", text: $viewModel.password)
//                .autocapitalization(.none)
//                .padding()
//                .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
//                .padding()
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
        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 5
    }
}
