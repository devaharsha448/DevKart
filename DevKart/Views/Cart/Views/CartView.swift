//
//  CartView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 07/04/26.
//

import SwiftUI
import Combine

struct CartView: View {
    
    @EnvironmentObject var cartManager: CartManager
    
    var body: some View {
        VStack {
            
            if cartManager.items.isEmpty {
                Text("Your cart is empty")
            } else {
                List {
                    ForEach(cartManager.items) { item in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(item.product.title)
                                Text("$\(item.product.price, specifier: "%.2f")")
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            HStack(spacing: 12) {
                                
                                Button {
                                    cartManager.removeFromCart(product: item.product)
                                } label: {
                                    Image(systemName: "minus.circle")
                                }
                                .buttonStyle(.borderless)
                                Text("\(item.quantity)")
                                    .frame(minWidth: 20)
                                
                                Button {
                                    cartManager.addToCart(product: item.product)
                                } label: {
                                    Image(systemName: "plus.circle")
                                }
                                .buttonStyle(.borderless)
                            }
                            
                            Button {
                                cartManager.deleteItemCompletely(product: item.product)
                            } label: {
                                Image(systemName: "trash")
                            }
                        }
                        .contentShape(Rectangle())
                    }
                }
                
                VStack {
                    Text("Total: $\(cartManager.totalPrice, specifier: "%.2f")")
                        .font(.title2.bold())
                    
                    Button("Proceed to Checkout") {
                        // checkout logic
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .cornerRadius(12)
                }
                .padding()
            }
        }
        .navigationTitle("My Cart")
//        .navigationBarTitleDisplayMode(.inline)
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager()) // ✅ REQUIRED
}
