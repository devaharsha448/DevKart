//
//  User.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 08/04/26.
//
import SwiftData

@Model
class UserModel {
    
    @Attribute(.unique) var id: String
    
    var username: String
    var email: String
    var phone: String?
    
    var passwordHash: String  
    
    // Relationships
    @Relationship(deleteRule: .cascade)
    var addresses: [AddressModel] = []
    
    @Relationship(deleteRule: .cascade)
    var cartItems: [CartItemModel] = []
    
    @Relationship(deleteRule: .cascade)
    var orders: [OrderModel] = []
    
    init(
        id: String,
        username: String,
        email: String,
        passwordHash: String
    ) {
        self.id = id
        self.username = username
        self.email = email
        self.passwordHash = passwordHash
    }
}
