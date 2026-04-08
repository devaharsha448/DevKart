//
//  CustomTabBar.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 08/04/26.
//


import SwiftUI

struct CustomTabBar: View {
    
    @Binding var selectedTab: MainTab
    var cartCount: Int = 0
    
    var body: some View {
        HStack {
            ForEach(MainTab.allCases, id: \.self) { tab in
                Spacer()
                
                Button {
                    selectedTab = tab
                } label: {
                    VStack(spacing: 4) {
                        
                        ZStack(alignment: .topTrailing) {
                            
                            Image(systemName: tab.icon)
                                .font(.title3)
                            
                            
                            if tab == .cart && cartCount > 0 {
                                Text(cartCount > 99 ? "99+" : "\(cartCount)")
                                    .font(.caption2)
                                    .foregroundColor(.white)
                                    .padding(4)
                                    .background(Color.red)
                                    .clipShape(Circle())
                                    .offset(x: 10, y: -10)
                            }
                        }
                        
                        Text(tab.title)
                            .font(.caption2)
                    }
                    .foregroundColor(selectedTab == tab ? .blue : .gray)
                }
                
                Spacer()
            }
        }
        .padding(.vertical, 8)
        .background(Color.white)
        .shadow(color: .black.opacity(0.05), radius: 5)
    }
}
