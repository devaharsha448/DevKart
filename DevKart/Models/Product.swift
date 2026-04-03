//
//  Product.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//
import SwiftUI
import Foundation
struct Product: Identifiable, Codable {
    let id: UUID
    let title: String
    let price: Double
    let image: String
    let description: String
    
    init(
        id: UUID = UUID(),
        title: String,
        price: Double,
        image: String,
        description: String = ""
    ) {
        self.id = id
        self.title = title
        self.price = price
        self.image = image
        self.description = description
    }
}
