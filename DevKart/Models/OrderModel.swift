//
//  OrderModel.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 10/04/26.
//
import SwiftUI
import SwiftData

@Model
class OrderModel {
    
    var id: UUID
    var date: Date
    var totalAmount: Double
    
    // 🔗 Relation
    var user: UserModel?
    
    @Relationship(deleteRule: .cascade)
    var items: [OrderItemModel] = []
    
    init(totalAmount: Double) {
        self.id = UUID()
        self.date = Date()
        self.totalAmount = totalAmount
    }
}
