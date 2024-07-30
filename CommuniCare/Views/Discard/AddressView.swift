//
//  AddressView.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 7/20/24.
//

import SwiftUI

struct AddressView: View {
    @StateObject var viewModel = RegisterViewViewModel()
    @State var navigated = false
    
    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 10)
                
                Image(.logo).resizable().frame(width: 135/4, height: 205/4)
                    .frame(alignment: .center)
                
                Text("Address")
                    .font(.system(size: 35))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.darkGreen)
                    .padding(.leading, 28)
                
                Spacer().frame(height: 20)
                
                Text("Share a bit more about yourself so we can offer a more tailored experience!")
                    .font(.system(size: 20))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .padding(.leading, 15)
                
                Text("Address")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .padding(.leading, 15)
                
                Spacer().frame(maxHeight: 0)
                
                TextField("", text: $viewModel.address)
                    .padding()
                    .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
                    .padding()
                
                Text("City")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .padding(.leading, 15)
                
                Spacer().frame(maxHeight: 0)
                
                TextField("", text: $viewModel.city)
                    .padding()
                    .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
                    .padding()
                
                Text("State")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .padding(.leading, 15)
                
                Spacer().frame(maxHeight: 0)
                
                TextField("", text: $viewModel.state)
                    .padding()
                    .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
                    .padding()
                
                Text("Zip Code")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .padding(.leading, 15)
                
                Spacer().frame(maxHeight: 0)
                
                TextField("", text: $viewModel.zip)
                    .padding()
                    .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
                    .padding()
                
                NavigationLink(destination: HomeView(viewModel: HomeViewViewModel()).navigationBarBackButtonHidden(true), isActive: $navigated){
                    LargeButton(title: "Next",
                                backgroundColor: Color.darkGreen) {
                        // action when pressed
                        viewModel.register()
                        self.navigated.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    AddressView()
}
