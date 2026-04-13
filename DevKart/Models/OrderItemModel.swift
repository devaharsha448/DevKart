//
//  OrderItemModel.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 10/04/26.
//
import SwiftUI
import SwiftData

@Model
class OrderItemModel {
    
    var id: UUID
    
    var productId: Int
    var title: String
    var price: Double
    var quantity: Int
    
    var order: OrderModel?
    
    init(productId: Int, title: String, price: Double, quantity: Int) {
        self.id = UUID()
        self.productId = productId
        self.title = title
        self.price = price
        self.quantity = quantity
    }
}
