//
//  SignupView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 09/04/26.
//
import SwiftUI

struct SignupView: View {
    
    @State private var username = AppStrings.empty
    @State private var email = AppStrings.empty
    @State private var password =  AppStrings.empty
    
    var body: some View {
        VStack(spacing: 20) {
            
            DSAuthHeader(
                title: AppStrings.AuthHeaderTitle,
                subtitle: AppStrings.AuthHeaderSubtile
            )
            
            DSInputField(placeholder: AppStrings.usernamePlaceholder, text: $username)
            DSInputField(placeholder: AppStrings.emailPlaceholder, text: $email)
            DSInputField(placeholder: AppStrings.passwordPlaceholder, text: $password, isSecure: true)
            
            DSButton(title: AppStrings.signUpTitle) {
                // signup logic
            }
        }
        .padding()
    }
}
