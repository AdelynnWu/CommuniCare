//
//  LocationAccessView.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 6/26/24.
//

import SwiftUI

struct LocationAccessView: View {
    @ObservedObject var locationManager = LocationManager.shared
    @State var navigated = false
    
    var body: some View {
        NavigationView {
            VStack{
                Spacer().frame(height: 0)
                
                Image(.logo).resizable().frame(width: 135/4, height: 205/4)
                    .frame(alignment: .center)
                
                Spacer().frame(height: 80)
                
                Text("Location Access")
                    .font(.system(size: 35))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .fontWeight(.bold)
                    .foregroundStyle(Color.darkGreen)
                    .padding(.horizontal, 50)
                    .offset(y:-50)
                
                Spacer().frame(height: 20)
                
                Text("Please enable location access so we can find nearby clinics that offer the services you need.")
                    .font(.system(size: 20))
                    .multilineTextAlignment(.center)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.horizontal, 30)
                    .offset(y: -55)
                
                Spacer().frame(height: 60)
                
                Image(.locationIcon).resizable().frame(width: 182, height: 182, alignment: .center)
                
                Spacer().frame(height: 50)
                
                VStack{
                    NavigationLink(destination: HomeView(viewModel: HomeViewViewModel()), isActive: $navigated) {
                        Button {
                            // request access
                            LocationManager.shared.requestLocation()
                            self.navigated.toggle()
                        } label : {
                            Text("Enable").padding()
                                .font(.headline)
                                .foregroundColor(.white)
                        }
                        .frame(width: UIScreen.main.bounds.width)
                        .padding(.horizontal, -50)
                        .background(Color.darkGreen)
                        .clipShape(Capsule())
                        .padding()
                    }
                    
                    NavigationLink(destination: HomeView(viewModel: HomeViewViewModel()), isActive: $navigated) {
                        Button {
                            //Add logic here
                            self.navigated.toggle()
                        } label: {
                            Text("Don't allow")
                                .padding()
                            //This sets the text color
                                .foregroundColor(.gray)
                            //This sets the background shape and color
                                .background(
                                    .white.opacity(1),
                                    in: Capsule()
                                )
                        }.frame(width: UIScreen.main.bounds.width)
                            .padding(.horizontal, -32)
                            .offset(y: -10)
                    }
                    }
            }
        }
    }
}

#Preview {
    LocationAccessView()
}
