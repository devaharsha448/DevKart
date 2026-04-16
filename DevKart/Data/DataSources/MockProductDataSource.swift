//
//  MockProductDataSource.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 06/04/26.
//
import SwiftUI

final class MockProductDataSource: ProductDataSource {
    
    func getProducts() async throws -> [Product] {
        
        try await Task.sleep(nanoseconds: 1_000_000_000)
        
        return [
            
            // 👕 Fashion
            Product(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000001")!,
                title: "Casual T-Shirt",
                price: 799,
                image: "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab",
                description: "Comfortable cotton t-shirt",
                category: "Fashion"
            ),
            
            Product(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000002")!,
                title: "Denim Jacket",
                price: 2499,
                image: "https://images.unsplash.com/photo-1543076447-215ad9ba6923",
                description: "Stylish denim jacket",
                category: "Fashion"
            ),
            
            Product(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000003")!,
                title: "Summer Dress",
                price: 1899,
                image: "https://images.unsplash.com/photo-1496747611176-843222e1e57c",
                description: "Lightweight summer dress",
                category: "Fashion"
            ),
            
            Product(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000004")!,
                title: "Hoodie",
                price: 1599,
                image: "https://images.unsplash.com/photo-1556821840-3a63f95609a7",
                description: "Warm hoodie",
                category: "Fashion"
            ),

            // 💄 Beauty
            Product(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000005")!,
                title: "Lipstick Set",
                price: 999,
                image: "https://images.unsplash.com/photo-1586495777744-4413f21062fa",
                description: "Matte finish lipsticks",
                category: "Beauty"
            ),
            
            Product(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000006")!,
                title: "Face Serum",
                price: 1299,
                image: "https://images.unsplash.com/photo-1608248597279-f99d160bfcbc",
                description: "Glowing skin serum",
                category: "Beauty"
            ),
            
            Product(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000007")!,
                title: "Perfume",
                price: 1999,
                image: "https://images.unsplash.com/photo-1523293182086-7651a899d37f",
                description: "Long-lasting fragrance",
                category: "Beauty"
            ),
            
            Product(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000008")!,
                title: "Makeup Kit",
                price: 2999,
                image: "https://images.unsplash.com/photo-1512496015851-a90fb38ba796",
                description: "Complete makeup kit",
                category: "Beauty"
            ),

            // 💻 Electronics
            Product(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000009")!,
                title: "Wireless Headphones",
                price: 3499,
                image: "https://images.unsplash.com/photo-1518444065439-e933c06ce9cd",
                description: "Noise cancelling headphones",
                category: "Electronics"
            ),
            
            Product(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000010")!,
                title: "Smart Watch",
                price: 4999,
                image: "https://images.unsplash.com/photo-1516574187841-cb9cc2ca948b",
                description: "Fitness tracking watch",
                category: "Electronics"
            ),
            
            Product(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000011")!,
                title: "Bluetooth Speaker",
                price: 2199,
                image: "https://images.unsplash.com/photo-1585386959984-a4155224a1ad",
                description: "Portable speaker",
                category: "Electronics"
            ),
            
            Product(
                id: UUID(uuidString: "00000000-0000-0000-0000-000000000012")!,
                title: "Laptop Stand",
                price: 1499,
                image: "https://images.unsplash.com/photo-1587202372775-e229f172b9d7",
                description: "Ergonomic stand",
                category: "Electronics"
            )
        ]
    }
}
