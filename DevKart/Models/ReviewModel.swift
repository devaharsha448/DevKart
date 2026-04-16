//
//  ReviewModel.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 15/04/26.
//


import SwiftData
import SwiftUI

@Model
class ReviewModel {
    
    var id: UUID
    var productId: UUID
    var userId: String
    var username: String
    
    var rating: Int
    var comment: String
    
    var createdAt: Date
    
    init(productId: UUID, userId: String, username: String, rating: Int, comment: String) {
        self.id = UUID()
        self.productId = productId
        self.userId = userId
        self.username = username
        self.rating = rating
        self.comment = comment
        self.createdAt = Date()
    }
}
