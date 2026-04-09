//
//  AccountView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 08/04/26.
//
import SwiftUI

struct AccountView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            
            // 👤 User Info
            VStack(alignment: .leading) {
                Text(authVM.user?.username ?? AppStrings.empty)
                    .font(.headline)
                
                Text(authVM.user?.email ?? AppStrings.empty)
                    .font(.caption)
                    .foregroundColor(.gray)
            }
            
            Divider()
            
            // 📦 Sections
            AccountRow(title: AppStrings.myOrders, icon: "bag")
            AccountRow(title: AppStrings.addresses, icon: "location")
            AccountRow(title: AppStrings.personalDetails, icon: "person")
            
            Spacer()
            
            // 🚪 Logout
            Button(AppStrings.logout) {
                authVM.logout()
            }
            .foregroundColor(.red)
        }
        .padding()
    }
}
