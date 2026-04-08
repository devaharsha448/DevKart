//
//  TabView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 07/04/26.
//

import SwiftUI

struct ContentView: View{
    
    var body : some View{
        TabView {
            
            NavigationStack {
                HomeView()
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }
            
            NavigationStack {
                CartView()
            }
            .tabItem {
                Label("Cart", systemImage: "cart")
            }
        }

    }
  
}
