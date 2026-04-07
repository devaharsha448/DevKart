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
    
    var body: some Scene {
        WindowGroup {
           ContentView().environmentObject(cartManager)
        }
        
    }
}
