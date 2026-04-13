//
//  OrderSuccessView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 13/04/26.
//


import SwiftUI

struct OrderSuccessView: View {
    
    var body: some View {
        VStack(spacing: 20) {
            
            Spacer()
            
            Image(systemName: "checkmark.circle.fill")
                .font(.system(size: 80))
                .foregroundColor(.green)
            
            Text("Order Placed Successfully!")
                .font(.title2.bold())
            
            Text("Your order will be delivered soon 🚚")
                .foregroundColor(.gray)
            
            Spacer()
            
            NavigationLink("Continue Shopping") {
               HomeView()
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.brown)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .padding()
        .navigationBarBackButtonHidden(true)
    }
}
