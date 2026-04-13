//
//  OrderSummaryView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 10/04/26.
//
import SwiftUI

struct OrderSummaryView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    var deliveryFee: Double { 40 }
    var discount: Double { 20 }
    
    var total: Double {
        cartManager.totalPrice + deliveryFee - discount
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Order Summary")
                .font(.headline)
            
            ForEach(cartManager.items) { item in
                HStack {
                    Text(item.title)
                    Spacer()
                    Text("x\(item.quantity)")
                    Text("$\(item.price * Double(item.quantity), specifier: "%.2f")")
                }
                .font(.caption)
            }
            
            Divider()
            
            PriceRow(title: "Subtotal", value: cartManager.totalPrice)
            PriceRow(title: "Delivery Fee", value: deliveryFee)
            PriceRow(title: "Discount", value: -discount)
            
            Divider()
            
            PriceRow(title: "Total", value: total, isBold: true)
        }
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
