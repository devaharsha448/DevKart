//
//  MockProductDataSource.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 06/04/26.
//
import SwiftUI

final class MockProductDataSource: ProductDataSource {
    
    func getProducts() async throws -> [Product] {
        
        // simulate API delay
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        return [
            Product(title: "Golden Ring", price: 320, image: "ring1", description: "Luxury ring"),
            Product(title: "Necklace", price: 450, image: "Necklace", description: "Elegant necklace"),
            Product(title: "Bracelet", price: 220, image: "Bracelet", description: "Stylish bracelet")
        ]
    }
}
