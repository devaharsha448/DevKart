//
//  AddressModel.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 10/04/26.
//
import SwiftUI
import SwiftData

@Model
class AddressModel {
    
    var id: UUID
    var name: String
    var phone: String
    var line1: String
    var city: String
    var state: String
    var pincode: String
    
    var isDefault: Bool
    
    // 🔗 Relation
    var user: UserModel?
    
    init(
        name: String,
        phone: String,
        line1: String,
        city: String,
        state: String,
        pincode: String,
        isDefault: Bool = false
    ) {
        self.id = UUID()
        self.name = name
        self.phone = phone
        self.line1 = line1
        self.city = city
        self.state = state
        self.pincode = pincode
        self.isDefault = isDefault
    }
}
