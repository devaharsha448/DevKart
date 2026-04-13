//
//  PaymentView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 10/04/26.
//

import SwiftUI

struct PaymentView: View {
    
    @State private var selectedMethod: PaymentMethod = .upi
    @EnvironmentObject var authVM: AuthViewModel
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.modelContext) var context

    @State private var showSuccess = false
    
    var body: some View {
        VStack(spacing: 16) {
            
            Text("Select Payment Method")
                .font(.headline)
            
            ForEach(PaymentMethod.allCases, id: \.self) { method in
                
                HStack {
                    Text(method.rawValue)
                    
                    Spacer()
                    
                    if selectedMethod == method {
                        Image(systemName: "checkmark.circle.fill")
                            .foregroundColor(.green)
                    }
                }
                .padding()
                .background(Color(.systemGray6))
                .cornerRadius(10)
                .onTapGesture {
                    selectedMethod = method
                }
            }
            
            Spacer()
            
            Button("Pay Now") {
                guard let user = authVM.user else { return }
                
                OrderManager.shared.placeOrder(
                    user: user,
                    cartItems: cartManager.items,
                    context: context
                )
                
                // Clear local cart array
                cartManager.items.removeAll()
                
                showSuccess = true
            }
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.brown)
            .foregroundColor(.white)
            .cornerRadius(12)
        }
        .padding()
        .navigationTitle("Payment")
        .navigationDestination(isPresented: $showSuccess) {
            OrderSuccessView()
        }
    }
}
