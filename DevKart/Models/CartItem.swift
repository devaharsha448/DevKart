//
//  CartItem.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 07/04/26.
//
import SwiftUI

struct CartItem: Identifiable {
    let id = UUID()
    let product: Product
    var quantity: Int
}
