//
//  DSAuthHeader.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 09/04/26.
//


import SwiftUI

struct DSAuthHeader: View {
    
    let title: String
    let subtitle: String
    
    var body: some View {
        VStack(spacing: 8) {
            Image(systemName: "cart.fill")
                .font(.largeTitle)
                .foregroundColor(.brown)
            
            Text("DevKart")
                .font(.title)
                .fontWeight(.bold)
            
            Text(title)
                .font(.title2)
                .fontWeight(.semibold)
            
            Text(subtitle)
                .font(.caption)
                .foregroundColor(.gray)
        }
    }
}
