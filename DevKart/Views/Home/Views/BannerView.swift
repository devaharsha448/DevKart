//
//  BannerView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//
import SwiftUI

struct BannerView: View {
    
    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image("banner")
                .resizable()
                .scaledToFill()
                .frame(height: 180)
                .clipped()
                .cornerRadius(16)
            
            VStack(alignment: .leading) {
                Text("20% OFF")
                    .font(.title.bold())
                    .foregroundColor(.white)
                
                Button("Shop Now") {}
                    .padding(.horizontal)
                    .padding(.vertical, 6)
                    .background(Color.white)
                    .cornerRadius(10)
            }
            .padding()
        }
    }
}
