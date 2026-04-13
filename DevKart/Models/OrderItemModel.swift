//
//  OrderItemModel.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 13/04/26.
//


import SwiftData
import SwiftUI

@Model
class OrderItemModel {
    
    var id: UUID
    var productId: UUID
    var title: String
    var price: Double
    var quantity: Int
    var order : OrderModel?
    
    init(productId: UUID, title: String, price: Double, quantity: Int) {
        self.id = UUID()
        self.productId = productId
        self.title = title
        self.price = price
        self.quantity = quantity
    }
}
