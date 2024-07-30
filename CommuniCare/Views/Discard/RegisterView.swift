//
//  RegisterView.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 6/26/24.
//

import SwiftUI

struct RegisterView: View {
    
    // Onboarding states:
    /*
     0: name, email, password
     1: gender, age, language, insurance
     2: address
     */
    @State var onboardingState: Int = 0
    let transition: AnyTransition = .asymmetric(insertion: .move(edge: .trailing), removal: .move(edge: .leading))
    
    @StateObject var viewModel = RegisterViewViewModel()
    @State var navigated = false
    
    @State var email: String = ""
    @State var firstName: String = ""
    @State var lastName: String = ""
    @State var password: String = ""
    @State var age: Int = 0
    @State var gender: String = ""
    @State var insurance: String = ""
    @State var policy: String = ""
    @State var distance: String = ""
    @State var address: String = ""
    @State var city: String = ""
    @State var state: String = ""
    @State var zipCode: String = ""
    
    // alert
    @State var alertTitle: String = ""
    @State var showAlert: Bool = false
    
    // store registration info
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
    @AppStorage("signed_in") var currentUserSignedIn: Bool = false
    
    
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
    RegisterView()
}

// MARK: components
extension RegisterView {

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
//        NavigationLink(destination: AboutView().navigationBarBackButtonHidden(true), isActive: $navigated) {
//            LargeButton(title:
//                            onboardingState == 2 ? "Finish" : "Next",
//                        backgroundColor: Color.darkGreen) {
////                 print("register button")
//                self.navigated.toggle()
//            }
//        }
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
    
    private var emailText: some View {
        Text("Email")
            .font(.system(size: 15))
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 15)
            .padding(.leading, 15)
    }
    private var emailField: some View {
        TextField("ex. abc123@gmail.com", text: $email)
            .autocapitalization(.none)
            .padding()
            .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
            .padding()
    }
    
    private var firstNameText: some View {
        Text("First Name")
            .font(.system(size: 15))
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 15)
            .padding(.leading, 15)
    }
    
    private var firstNameField: some View {
        TextField("ex. John", text: $firstName)
            .autocapitalization(.none)
            .padding()
            .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
            .padding()
    }
    
    private var lastNameText: some View {
        Text("Last Name")
            .font(.system(size: 15))
            .multilineTextAlignment(.leading)
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.leading, 15)
            .padding(.leading, 15)
    }
    
    private var lastNameField: some View {
        TextField("ex. Simpson", text: $lastName)
            .autocapitalization(.none)
            .padding()
            .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
            .padding()
    }
    
    private var passwordText: some View {
            Text("Password")
                .font(.system(size: 15))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.leading, 15)
                .padding(.leading, 15)
    }
    
    private var passwordField: some View {
        SecureField("", text: $password)
            .autocapitalization(.none)
            .padding()
            .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
            .padding()
    }
    
    
    
    private var registerForm: some View {
        VStack {
            Spacer().frame(height: 0)
            
            Image(.logo).resizable().frame(width: 135/4, height: 205/4)
                .frame(alignment: .center)
            registerText
            Spacer().frame(height: 20)
            descriptionText
            Spacer().frame(height: 50)
            emailText
            Spacer().frame(maxHeight: 0)
            emailField
            firstNameText
            Spacer().frame(maxHeight: 0)
            firstNameField
            lastNameText
            Spacer().frame(maxHeight: 0)
            lastNameField
            passwordText
            Spacer().frame(maxHeight: 0)
            passwordField
            Spacer().frame(height: 5)
            
            nextButton
        }
    }
    
    private var aboutForm: some View {
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
                

                TextField("", value: $age, formatter: NumberFormatter())
                    .padding()
                    .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
                    .padding()
                
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
                    Text("Non-binary").foregroundStyle(Color.black).tag("Non-binary")
                }.pickerStyle(MenuPickerStyle())
                    .frame(width: 360, height: 50)
                    .overlay {
                    RoundedRectangle(cornerRadius: 18)
                     .stroke(Color.matchaGreen, lineWidth: 2)
                    }.padding()
                
                Text("Health Insurance Plan")
                    .font(.system(size: 15))
                    .multilineTextAlignment(.leading)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 15)
                    .padding(.leading, 15)
                
                Spacer().frame(maxHeight: 0)
                
                TextField("", text: $insurance)
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
                
                TextField("", text: $policy)
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
                nextButton
            }
        }
    }
    
    private var addressForm: some View {
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
                
                TextField("", text: $address)
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
                
                TextField("", text: $city)
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
                
                TextField("", text: $state)
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
                
                TextField("", text: $zipCode)
                    .padding()
                    .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
                    .padding()
                
                nextButton
            }
        }
    }
}

// MARK: functions
extension RegisterView {
    
    func handleButtonPressed() {
        
        // check inputs
        switch onboardingState{
        case 0:
            guard checkInputs0() else {
                showAlert(title: "Fields not completed.")
                return
            }
        case 1:
            guard checkInputs1() else {
                showAlert(title: "Fields not completed.")
                return
            }
        case 2:
            guard checkInputs2() else {
                showAlert(title: "fields not completed.")
                return
            }
        default:
            break
        }
        
        //
        if onboardingState == 2 {
            // sign up
            signIn()
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
    
    func checkInputs0() -> Bool {
        guard !email.trimmingCharacters(in: .whitespaces).isEmpty,
              !password.trimmingCharacters(in: .whitespaces).isEmpty,
              !lastName.trimmingCharacters(in: .whitespaces).isEmpty else {
            return false
        }
        guard email.contains("@"), email.contains(".") else {
            return false
        }
        guard password.count >= 8 else {
            return false
        }
        
        return true
    }
    
    func checkInputs1() -> Bool {
        guard (gender.count >= 1) else {
            return false
        }
        return true
    }
    
    func checkInputs2() -> Bool {
        guard !address.isEmpty, !city.isEmpty, !state.isEmpty, !zipCode.isEmpty else {
            return false
        }
        return true
    }
    
    func signIn() {
        userEmail = email
        userFirstName = firstName
        userLastName = lastName
        userPassword = password
        userAge = age
        userGender = gender
        userInsurance = insurance
        userPolicy = policy
        userAddress = address
        userCity = city
        userState = state
        userZipCode = zipCode
        
        viewModel.email = email
        viewModel.firstName = firstName
        viewModel.lastName = lastName
        viewModel.password = password
        viewModel.age = age
        viewModel.sex = gender
        viewModel.insurance = insurance
        viewModel.policy = policy
        viewModel.address = address
        viewModel.city = city
        viewModel.state = state
        viewModel.zip = zipCode
        
        viewModel.register()
        currentUserSignedIn = true
    }
}
