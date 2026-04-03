//
//  Order.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//
import SwiftUI


struct Order: Identifiable, Codable {
    let id: UUID
    let products: [Product]
    let total: Double
    let date: Date
}
