//
//  AppRouter.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 08/04/26.
//
import SwiftUI

import SwiftUI
struct AppRouter: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    @Environment(\.modelContext) var context
    
    @State private var didLoad = false
    
    var body: some View {
        Group {
            if authVM.isLoggedIn {
                MainTabContainer()
            } else {
                LoginView()
            }
        }
        .onAppear {
            if !didLoad {
                authVM.loadUser(context: context)
                didLoad = true
            }
        }
    }
}
