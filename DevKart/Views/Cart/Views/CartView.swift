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
    @Environment(\.modelContext) var context
    
    var body: some View {
        VStack {
            
            if cartManager.items.isEmpty {
                Spacer()
                Text("Your cart is empty")
                    .font(.headline)
                    .foregroundColor(.gray)
                Spacer()
            } else {
                
                ScrollView {
                    VStack(spacing: 16) {
                        
                        ForEach(cartManager.items) { item in
                            
                            HStack {
                                VStack(alignment: .leading, spacing: 6) {
                                    Text(item.title)
                                        .font(.headline)
                                    
                                    Text("$\(item.price, specifier: "%.2f")")
                                        .foregroundColor(.gray)
                                }
                                
                                Spacer()
                                
                                HStack(spacing: 12) {
                                    
                                    Button {
                                        cartManager.decrement(item: item, context: context)
                                    } label: {
                                        Image(systemName: "minus.circle.fill")
                                            .foregroundColor(.gray)
                                    }
                                    
                                    Text("\(item.quantity)")
                                        .frame(minWidth: 20)
                                    
                                    Button {
                                        cartManager.increment(item: item, context: context)
                                    } label: {
                                        Image(systemName: "plus.circle.fill")
                                            .foregroundColor(.gray)
                                    }
                                }
                                
                                Button {
                                    cartManager.delete(item: item, context: context)
                                } label: {
                                    Image(systemName: "trash")
                                        .foregroundColor(.brown)
                                }
                            }
                            .padding()
                            .background(Color(.systemGray6))
                            .cornerRadius(12)
                        }
                    }
                    .padding()
                }
                
               
                VStack(spacing: 12) {
                    
                    HStack {
                        Text("Total")
                            .font(.headline)
                        
                        Spacer()
                        
                        Text("$\(cartManager.totalPrice, specifier: "%.2f")")
                            .font(.title3.bold())
                    }
                    
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
                .background(Color(.systemBackground))
            }
        }
        .navigationTitle("My Cart")
        .onAppear {
            cartManager.loadCart(context: context)
        }
    }
}

#Preview {
    CartView()
        .environmentObject(CartManager())
}
