//
//  ForgotPasswordView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 09/04/26.
//
import SwiftUI

struct ForgotPasswordView: View {
    
    @State private var email = ""
    
    var body: some View {
        VStack(spacing: 20) {
            
            DSAuthHeader(
                title: AppStrings.DSheaderTitle,
                subtitle: AppStrings.DSHeaderSubTitle
            )
            
            DSInputField(placeholder: AppStrings.emailPlaceholder, text: $email)
            
            DSButton(title: AppStrings.PasswordResetButton) {
                // reset logic
            }
        }
        .padding()
    }
}
