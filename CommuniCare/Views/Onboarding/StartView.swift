//
//  StartView.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 7/15/24.
//

import SwiftUI

struct StartView: View {
    @State var signUpNavigated = false
    @State var logInNavigated = false
    
    var body: some View {
        NavigationView {
            VStack{
                VStack {
                    Spacer().frame(height: 150)
                    // header
                    Image("logo").resizable().frame(width: 135, height: 205)
                    Text("CommuniCare")
                        .font(.system(size: 35))
                        .fontWeight(.bold)
                        .foregroundStyle(Color.matchaGreen)
                    Text("Navigating Health Together")
                        .font(.system(size: 15))
                        .italic()
                }.offset(y: -30)
                
                Spacer().frame(height: 50)
                
                NavigationLink(destination: RegistrationView(), isActive: $signUpNavigated) {
                    Button {
                        self.signUpNavigated.toggle()
                    } label : {
                        Text("Sign Up").padding()
                            .font(.headline)
                            .foregroundColor(.white)
                    }
                    .frame(width: 370)
                    .padding(.horizontal, -50)
                    .background(Color.darkGreen)
                    .clipShape(Capsule())
                    .padding()
                }
                
                NavigationLink(destination: LoginView(), isActive: $logInNavigated) {
                    Button {
                        self.logInNavigated.toggle()
                    } label : {
                        Text("Log In").padding()
                            .font(.headline)
                            .foregroundColor(Color.matchaGreen)
                    }
                    .frame(width: 370)
                    .padding(.horizontal, -50)
                    .background(Color.white)
                    .clipShape(Capsule())
                    .overlay(alignment: .center, content: {
                        RoundedRectangle(cornerRadius: /*@START_MENU_TOKEN@*/25.0/*@END_MENU_TOKEN@*/)
                            .stroke(Color.matchaGreen)
                            .foregroundColor(.white)
                        
                    })
                    .padding()
                }
                
                
//                NavigationLink("log in") {
//                    LoginView()
//                }.buttonStyle(LargeButtonStyle(backgroundColor: .white, foregroundColor: Color.matchaGreen, isDisabled: false))
                
            }
        }
    }
}

#Preview {
    StartView()
}
