//
//  CartManager.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 07/04/26.
//
import SwiftUI
import SwiftData
import Combine

class CartManager: ObservableObject {
    
    @Published var items: [CartItemModel] = []
    
    private let dataManager = SwiftDataManager()
    
    // Load once (onAppear)
    func loadCart(for user: UserModel, context: ModelContext) {
        
        func loadCart(for user: UserModel, context: ModelContext) {
            
            let userId = user.id
            
            let predicate = #Predicate<CartItemModel> {
                $0.userId == userId
            }
            
            items = dataManager.fetch(
                CartItemModel.self,
                context: context,
                predicate: predicate
            )
        }
    }
    // Add to cart
    func addToCart(product: Product, user: UserModel, context: ModelContext) {
        
        if let existing = items.first(where: { $0.productId == product.id }) {
            existing.quantity += 1
        } else {
            let newItem = CartItemModel(
                product: product,
                quantity: 1,
                userId: user.id
            )
            newItem.user = user
            user.cartItems.append(newItem)
            
            context.insert(newItem)
            items.append(newItem)
        }
        
        try? context.save()
    }
    // Increment
    func increment(item: CartItemModel, context: ModelContext) {
        item.quantity += 1
        try? context.save()
    }
    
    // Decrement
    func decrement(item: CartItemModel, context: ModelContext) {
        if item.quantity > 1 {
            item.quantity -= 1
        } else {
            context.delete(item)
            items.removeAll { $0.id == item.id }
        }
        
        try? context.save()
    }
    
    // Delete completely
    func delete(item: CartItemModel, context: ModelContext) {
        context.delete(item)
        items.removeAll { $0.id == item.id } 
        try? context.save()
    }
    
    // (Optional) remove old API if not used anymore
    func removeFromCart(product: Product, context: ModelContext) {
        guard let item = items.first(where: { $0.productId == product.id }) else { return }
        decrement(item: item, context: context)
    }
    
    // Total Price
    var totalPrice: Double {
        items.reduce(0) { $0 + ($1.price * Double($1.quantity)) }
    }
}
