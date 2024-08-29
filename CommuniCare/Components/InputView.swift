//
//  InputView.swift
//  CommuniCare
//
//  Created by Hsia Lu wu on 7/26/24.
//

import SwiftUI

struct InputView: View {
    
    @Binding var text: String
    let title: String
    let placeholder: String
    var isSucureField = false
    
    var body: some View {
        VStack {
            Text(title)
                .font(.system(size: 15))
                .multilineTextAlignment(.leading)
                .frame(maxWidth: .infinity, alignment: .leading)
                .padding(.horizontal)
            
            if isSucureField {
                SecureField("", text: $text)
                    .autocapitalization(.none)
                    .padding()
                    .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
                    .padding(.horizontal)
            } else {
                TextField(placeholder, text: $text)
                    .autocapitalization(.none)
                    .padding()
                    .overlay(Color.matchaGreen, in: .rect(cornerRadius: 18).stroke(lineWidth: 2))
                    .padding(.horizontal)
            }
        }
    }
}

struct InputView_Previews: PreviewProvider {
    static var previews: some View {
        InputView(text: .constant(""), title: "Email", placeholder: "name@example.com")
    }
}
