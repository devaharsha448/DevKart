//
//  DevKartApp.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//

import SwiftUI
import SwiftData

@main
struct DevKartApp: App {
    @StateObject var cartManager = CartManager()
    @StateObject private var authVM = AuthViewModel()
        
    
    var body: some Scene {
        WindowGroup {
           AppRouter().environmentObject(cartManager) .environmentObject(authVM)
        }
        .modelContainer(for: [
            UserModel.self,
            AddressModel.self,
            CartItemModel.self,
            OrderModel.self,
            OrderItemModel.self,
            ReviewModel.self
        ])
    }
}
