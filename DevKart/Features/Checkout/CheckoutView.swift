//
//  CheckoutView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 10/04/26.
//


import SwiftUI

struct CheckoutView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack(spacing: 0) {
            
            ScrollView {
                VStack(spacing: 20) {
                    
                    // 📍 Address Section
                    AddressSectionView()
                    
                    Divider()
                    
                    // 🧾 Order Summary
                    OrderSummaryView()
                }
                .padding()
            }
            
            // 💳 Bottom CTA
            NavigationLink {
                PaymentView()
            } label: {
                Text("Proceed to Pay")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                    .padding()
            }
            .background(Color(.systemBackground))
        }
        .navigationTitle("Checkout")
    }
}
