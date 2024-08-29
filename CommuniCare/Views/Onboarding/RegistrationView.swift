//
//  RegistrationView.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 7/26/24.
//

import SwiftUI

struct RegistrationView: View {
    // Onboarding states:
    /*
     0: name, email, password
     1: gender, age, language, insurance
     2: address
     */
    @State var onboardingState: Int = 0
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    @EnvironmentObject var viewModel: AuthViewModel
    @State var navigated = false
    @Environment(\.dismiss) var dismiss
    
    // alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    @State var email: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var username: String = ""
    @State var password: String = ""
    @State var confirmPassword: String = ""
    @State var age: Int = 0
    @State var gender: String = ""
    @State var insurance: String = ""
    @State var policy: String = ""
    @State var distance: String = ""
    @State var address: String = ""
    @State var city: String = ""
    @State var state: String = ""
    @State var zipCode: String = ""
    
    
    var body: some View {
        ZStack {
            switch onboardingState {
                case 0:
                registerForm.transition(transition)
                case 1:
                aboutForm.transition(transition)
                case 2:
                addressForm.transition(transition)
                default:
                HomeView(viewModel: HomeViewViewModel())
            }
        }.alert(isPresented: $showAlert) {
            return Alert(title: Text(alertTitle))
        }
    }
}

#Preview {
    RegistrationView()
}

// MARK: Components
extension RegistrationView {
    
    private var nextButton: some View {
        Text(onboardingState == 2 ? "Finish" : "Next")
            .font(.headline)
            .foregroundStyle(Color.white)
            .frame(width: 100, height: 50)
            .background(Color.darkGreen)
            .cornerRadius(18)
            .animation(nil)
            .onTapGesture {
                handleButtonPressed()
            }
    }
    
    private var registerText: some View {
        Text("Register")
            .font(.system(size: 35))
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .fontWeight(.bold)
            .foregroundStyle(Color.darkGreen)
            .padding(.leading, 28)
    }
    
    private var descriptionText: some View {
        Text("Create an account to access all the features of CommuniCare!")
            .font(.system(size: 20))
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 15)
            .padding(.leading, 15)
    }
    
    private var ageField: some View {
        VStack {
            Text("Age")
                .font(.system(size: 15))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
                .padding(.leading, 15)
            

            TextField("", value: $age, formatter: NumberFormatter())
                .padding()
                .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
                .padding()
        }
    }
    
    private var genderPicker: some View {
        VStack {
            Text("Gender")
                .font(.system(size: 15))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
                .padding(.leading, 15)
            
            Spacer().frame(maxHeight: 0)
            
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
                Text("Transgender").foregroundStyle(Color.black).tag("Transgender")
                Text("Non-binary").foregroundStyle(Color.black).tag("Non-binary/Non-conforming")
                Text("Prefer not to answer").foregroundStyle(Color.black).tag("Prefer not to answer")
            }.pickerStyle(MenuPickerStyle())
                .frame(width: 360, height: 50)
                .overlay {
                RoundedRectangle(cornerRadius: 18)
                 .stroke(Color.matchaGreen, lineWidth: 2)
                }.padding()
        }
    }
    
    private var registerForm: some View {
        VStack {
            Spacer().frame(height: 0)
            Image(.logo).resizable().frame(width: 135/4, height: 205/4)
                .frame(alignment: .center)
            registerText
            descriptionText
            VStack {
                InputView(text: $email, title: "Username", placeholder: "john123")
                    .autocapitalization(.none)
                .padding(.top, 25)
            InputView(text: $firstName, title: "First Name", placeholder: "John")
            InputView(text: $lastName, title: "Last Name", placeholder: "Simpson")
            InputView(text: $password, title: "Password", placeholder: "Enter your password", isSucureField: true)
                ZStack(alignment: .trailing) {
                    InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSucureField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill").imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemGreen)).offset(x: -25, y: 13)
                        } else {
                            Image(systemName: "xmark.circle.fill").imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundColor(Color(.systemRed)).offset(x:  -25, y: 13)
                        }
                    }
                }
        }.offset(y: -15)
        // next button
        nextButton.padding(.top, 15).padding(.bottom).disabled(!form1IsValid).opacity(form1IsValid ? 1.0 : 0.5)
        // log in link
        Button {
            dismiss()
        } label: {
            HStack(spacing: 3){
                Text("Already have an account?")
                Text("Log In").fontWeight(.bold)
            }
            .font(.system(size: 14))
            }
        }
    }
    
    private var aboutForm: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 10)
                Image(.logo).resizable().frame(width: 135/4, height: 205/4)
                    .frame(alignment: .center)
                    .offset(y: 10)
                
                VStack {
                    Text("About You")
                        .font(.system(size: 35))
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .fontWeight(.bold)
                        .foregroundStyle(Color.darkGreen)
                        .padding(.leading, 28)
                    
                    Text("Share a bit more about yourself so we can offer a more tailored experience!")
                        .font(.system(size: 20))
                        .fixedSize(horizontal: false, vertical: true)
                        .multilineTextAlignment(.leading)
                        .frame(maxWidth: .infinity, alignment: .leading)
                        .padding(.leading, 15)
                        .padding(.leading, 15)
                }
                
                ageField
                genderPicker
                InputView(text: $insurance, title: "Health Insurance Plan", placeholder: "")
                InputView(text: $policy, title: "Policy Name", placeholder: "")
                InputView(text: $distance, title: "Distance Preference", placeholder: "")
                nextButton.disabled(!form2IsValid).opacity(form2IsValid ? 1.0 : 0.5)
            }.offset(y: -25)
        }
    }
    
    private var addressForm: some View {
        NavigationView {
            VStack {
                Spacer().frame(height: 10)
                
                Image(.logo).resizable().frame(width: 135/4, height: 205/4)
                    .frame(alignment: .center)
                    .offset(y: -25)
                
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
                
                VStack {
                    InputView(text: $address, title: "Address", placeholder: "")
                    InputView(text: $city, title: "City", placeholder: "")
                    InputView(text: $state, title: "State", placeholder: "")
                    InputView(text: $zipCode, title: "Zip Code", placeholder: "")
                }.offset(y: 18)
                
                nextButton.disabled(!form3IsValid).opacity(form3IsValid ? 1.0 : 0.5).offset(y: 25)
            }.offset(y: -25)
        }
    }
}

// MARK: Functions
extension RegistrationView {
    func handleButtonPressed() {
        if onboardingState == 2 {
            // sign up
            Task {
                try await viewModel.createUser(withEmail:email, password:password, firstName:firstName, lastName:lastName, age:age, sex:gender, insurance:insurance, policy:policy, address:address, city:city, state:state, zipCode:zipCode)
            }
        } else {
            withAnimation(.spring()){
                onboardingState += 1
            }
        }
    }
    
    func showAlert(title: String) {
        alertTitle = title
        showAlert.toggle()
    }
}

// MARK: AuthenticationFormProtocol
extension RegistrationView: RegistrationFormProtocol {
    var form1IsValid: Bool {
        return !password.isEmpty && password.count > 5 && !lastName.isEmpty && !firstName.isEmpty && confirmPassword == password
//        return !email.isEmpty && email.contains("@") && !password.isEmpty && password.count > 5 && !lastName.isEmpty && !firstName.isEmpty && confirmPassword == password
    }
    
    var form2IsValid: Bool {
        return !gender.isEmpty
    }
    
    var form3IsValid: Bool {
        return !address.isEmpty && !city.isEmpty && !state.isEmpty && !state.isEmpty
    }
}

