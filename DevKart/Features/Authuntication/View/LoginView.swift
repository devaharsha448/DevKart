//
//  LoginView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 09/04/26.
//


import SwiftUI

struct LoginView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    @Environment(\.modelContext) var context
    @State private var username = AppStrings.empty
    @State private var password = AppStrings.empty
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                Spacer()
                
                DSAuthHeader(
                    title: AppStrings.welcomeBack,
                    subtitle: AppStrings.subtitle
                )
                
                VStack(spacing: 16) {
                    
                    DSInputField(
                        placeholder: AppStrings.usernamePlaceholder,
                        text: $username
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
                        title: AppStrings.loginButton,
                        isLoading: authVM.isLoading
                    ) {
                        Task {
                            await authVM.login(
                                username: username,
                                password: password,
                                context: context
                            )
                        }
                    }
                    
                 
                    NavigationLink(AppStrings.forgotPassWordText, destination: ForgotPasswordView())
                        .font(.caption)
                    
                    NavigationLink(AppStrings.createAccountText, destination: SignupView())
                        .font(.caption)
                }
                .padding()
                .background(Color.white)
                .cornerRadius(16)
                .shadow(radius: 5)
                .padding(.horizontal)
                
                Spacer()
            }
        }
    }
}
