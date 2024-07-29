//
//  AboutView.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 6/26/24.
//

import SwiftUI

struct AboutView: View {
    
    // MARK: variables
    @StateObject var viewModel = RegisterViewViewModel()
    @State private var sexIndex = 0
    @State private var languageIndex = 0
    @State private var insuranceIndex = 0
    @State private var distance = ""
    @State var navigated = false
    
    @State var gender: String = ""
    
    // MARK: data
    let genders = ["Female", "Male", "Do not want to reveal"]
    let languages = ["English", "Mandarin", "French", "Spanish", "Japanese", "Korean", "Others"]
    let insuranPlans = ["United Health Care", "Student Health Plan", "Others"]

    var body: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 10)
                
                Image(.logo).resizable().frame(width: 135/4, height: 205/4)
                    .frame(alignment: .center)
                    .offset(y: 15)
                
                VStack {
                    Text("About You")
                        .font(.system(size: 35))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.darkGreen)
                        .padding(.leading, 28)
                    
//                    Spacer().frame(height: 10)
                    
                    Text("Share a bit more about yourself so we can offer a more tailored experience!")
                        .font(.system(size: 20))
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                        .padding(.leading, 15)
                }
                
                Text("Age")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .padding(.leading, 15)
                

                TextField("", value: $viewModel.age, formatter: NumberFormatter())
                    .padding()
                    .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
                    .padding()
                
                // Spacer().frame(height: 30)
                
                Text("Gender")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .padding(.leading, 15)
                
                Spacer().frame(maxHeight: 0)
                
                genderPicker
                
                Text("Health Insurance Plan")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .padding(.leading, 15)
                
                Spacer().frame(maxHeight: 0)
                
                TextField("", text: $viewModel.insurance)
                    .padding()
                    .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
                    .padding()
                
                Text("Policy Name")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .padding(.leading, 15)
                
                Spacer().frame(maxHeight: 0)
                
                TextField("", text: $viewModel.policy)
                    .padding()
                    .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
                    .padding()
                
                Text("Distance Preference")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .padding(.leading, 15)
                
                Spacer().frame(maxHeight: 0)
                
                TextField("", text: $distance)
                    .padding()
                    .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
                    .padding()
                
                NavigationLink(destination: AddressView().navigationBarBackButtonHidden(true), isActive: $navigated) {
                    LargeButton(title: "Next",
                                backgroundColor: Color.darkGreen) {
                         print("next button")
                        viewModel.sex = genders[sexIndex]
                        self.navigated.toggle()
                    }
                }
            }
        }
    }
}

#Preview {
    AboutView()
}

extension AboutView {
    private var genderPicker: some View {
        Picker(selection: $gender,
               label:
                Text(gender.count > 1 ? gender : "Select a gender")
                    .font(.headline)
                    .foregroundColor(.black)
                    .frame(height: 50)
                    .frame(maxWidth: .infinity)
                    .background(.white)
        ){
            Text("Male").foregroundStyle(Color.black).tag("Male")
            Text("Female").foregroundStyle(Color.black).tag("Female")
            Text("Non-binary").foregroundStyle(Color.black).tag("Non-binary")
        }.pickerStyle(MenuPickerStyle())
            .frame(width: 360, height: 50)
            .overlay {
            RoundedRectangle(cornerRadius: 18)
             .stroke(Color.matchaGreen, lineWidth: 2)
            }.padding()
    }
}
