//
//  MainTabContainer.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 08/04/26.
//


import SwiftUI

struct MainTabContainer: View {
    
    @State private var selectedTab: MainTab = .home
    @EnvironmentObject var authVM: AuthViewModel
    
    
    var body: some View {
        VStack(spacing: 0) {
            
           
            Group {
                switch selectedTab {
                case .home:
                    HomeView()
                case .play:
                    Text("Play Screen")
                case .categories:
                    Text("Categories Screen")
                case .account:
                    NavigationStack{
                        AccountView()
                            .environmentObject(authVM)
                    }
                case .cart:
                    NavigationStack{
                        CartView()
                    }
                }
            }
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            
            CustomTabBar(selectedTab: $selectedTab)
        }
        .ignoresSafeArea(.keyboard, edges: .bottom)
    }
}
