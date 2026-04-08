//
//  MainTabContainer.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 08/04/26.
//


import SwiftUI

struct MainTabContainer: View {
    
    @State private var selectedTab: MainTab = .home
    @State private var cartCount: Int = 2
    
    var body: some View {
        VStack(spacing: 0) {
            
            // 🔄 Screen Content
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                case .play:
                    Text("Play Screen")
                case .categories:
                    Text("Categories Screen")
                case .account:
                    Text("Account Screen")
                case .cart:
                    NavigationStack{
                        CartView()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            // 📌 Sticky Footer
            CustomTabBar(selectedTab: $selectedTab, cartCount: cartCount)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}
