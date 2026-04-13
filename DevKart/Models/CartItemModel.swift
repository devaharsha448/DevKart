//
//  CartItemModel.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 07/04/26.
//


import SwiftData
import SwiftUI

@Model
class CartItemModel {
    
    var id: UUID
    var productId: UUID
    var title: String
    var price: Double
    var quantity: Int
    
    // 🔗 Relation
    var user: UserModel?
    
    init(product: Product, quantity: Int = 1) {
        self.id = UUID()
        self.productId = product.id
        self.title = product.title
        self.price = product.price
        self.quantity = quantity
    }
}
