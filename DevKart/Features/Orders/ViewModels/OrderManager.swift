//
//  OrderManager.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 13/04/26.
//


import SwiftUI
import SwiftData

final class OrderManager {
    
    static let shared = OrderManager()
    
    private init() {}
    
    func placeOrder(
        user: UserModel,
        cartItems: [CartItemModel],
        context: ModelContext
    ) {
        guard !cartItems.isEmpty else { return }
        
        // ✅ Create Order
        let order = OrderModel(
            totalAmount: cartItems.reduce(0) {
                $0 + ($1.price * Double($1.quantity))
            },
            userId: user.id
        )
        
        order.user = user
        user.orders.append(order)
        
        // ✅ Convert Cart → Order Items (KEY STEP)
        let orderItems = cartItems.map {
            OrderItemModel(
                productId: $0.productId,
                title: $0.title,
                price: $0.price,
                quantity: $0.quantity
            )
        }
        
        orderItems.forEach{
            $0.order = order
        }
        
        order.items = orderItems
        
        // ✅ Save order
        context.insert(order)
        
        // ✅ NOW safe to delete cart
        cartItems.forEach { context.delete($0) }
        
        try? context.save()
    }
}
