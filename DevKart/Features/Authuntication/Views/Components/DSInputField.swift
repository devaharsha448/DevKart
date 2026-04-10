//
//  DSInputField.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 09/04/26.
//


import SwiftUI

struct DSInputField: View {
    
    let placeholder: String
    @Binding var text: String
    var isSecure: Bool = false
    
    @State private var isHidden: Bool = true
    
    var body: some View {
        HStack {
            
            if isSecure {
                Group {
                    if isHidden {
                        SecureField(placeholder, text: $text)
                    } else {
                        TextField(placeholder, text: $text)
                    }
                }
            } else {
                TextField(placeholder, text: $text)
            }
            
           
            if isSecure {
                Button {
                    isHidden.toggle()
                } label: {
                    Image(systemName: isHidden ? "eye.slash" : "eye")
                        .foregroundColor(.gray)
                }
            }
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
