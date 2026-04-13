//
//  OrderCardView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 13/04/26.
//


import SwiftUI

struct OrderCardView: View {
    
    let order: OrderModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            // 📅 Date
            Text(order.date.formatted(date: .abbreviated, time: .omitted))
                .font(.caption)
                .foregroundColor(.gray)
            
            // 💰 Total
            Text("₹\(order.totalAmount, specifier: "%.2f")")
                .font(.headline)
            
            Divider()
            
            // 📦 Items
            ForEach(order.items.prefix(2)) { item in
                HStack {
                    Text(item.title)
                        .lineLimit(1)
                    
                    Spacer()
                    
                    Text("x\(item.quantity)")
                }
                .font(.caption)
            }
            
            if order.items.count > 2 {
                Text("+\(order.items.count - 2) more items")
                    .font(.caption2)
                    .foregroundColor(.gray)
            }
        }
        .frame(maxWidth: .infinity, alignment: .leading) // ✅ full width
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}