//
//  CartManager.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 07/04/26.
//
import SwiftUI
import Combine

class CartManager: ObservableObject {
    
    @Published var items: [CartItem] = []
    
    // Add to Cart
    func addToCart(product: Product) {
        if let index = items.firstIndex(where: { $0.product.id == product.id }) {
            items[index].quantity += 1
        } else {
            items.append(CartItem(product: product, quantity: 1))
        }
    }
    
    // Remove item
    func removeFromCart(product: Product) {
        guard let index = items.firstIndex(where: { $0.product.id == product.id }) else { return }
        
        if items[index].quantity > 1 {
            items[index].quantity -= 1
        } else {
            items.remove(at: index)
        }
    }
    
    func deleteItemCompletely(product: Product) {
        items.removeAll { $0.product.id == product.id }
    }
    
    // Total Price
    var totalPrice: Double {
        items.reduce(0) { $0 + ($1.product.price * Double($1.quantity)) }
    }
}
