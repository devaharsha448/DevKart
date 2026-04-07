//
//  CartItemModel.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 07/04/26.
//


import SwiftData
import SwiftUI

@Model
class CartItemModel: Identifiable {
    
    var id: UUID
    var productId: UUID
    var title: String
    var price: Double
    var image: String
    var quantity: Int
    
    init(product: Product, quantity: Int) {
        self.id = UUID()
        self.productId = product.id
        self.title = product.title
        self.price = product.price
        self.image = product.image
        self.quantity = quantity
    }
}
