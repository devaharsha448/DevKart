//
//  SignupView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 09/04/26.
//
import SwiftUI


struct SignupView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @State private var username = AppStrings.empty
    @State private var email = AppStrings.empty
    @State private var password = AppStrings.empty
    
    var body: some View {
        VStack(spacing: 20) {
            
            DSAuthHeader(
                title: AppStrings.AuthHeaderTitle,
                subtitle: AppStrings.AuthHeaderSubtile
            )
            
            DSInputField(
                placeholder: AppStrings.usernamePlaceholder,
                text: $username
            )
            
            DSInputField(
                placeholder: AppStrings.emailPlaceholder,
                text: $email
            )
            
            DSInputField(
                placeholder: AppStrings.passwordPlaceholder,
                text: $password,
                isSecure: true
            )
            
           
            if let error = authVM.errorMessage {
                Text(error)
                    .foregroundColor(.red)
                    .font(.caption)
            }
            
           
            DSButton(
                title: AppStrings.signUpTitle,
                isLoading: authVM.isLoading
            ) {
                Task {
                    await authVM.signup(
                        username: username,
                        email: email,
                        password: password,
                        context: context
                    )
                    
                    if authVM.user != nil {
                        dismiss()
                    }
                }
            }
        }
        .padding()
    }
}



