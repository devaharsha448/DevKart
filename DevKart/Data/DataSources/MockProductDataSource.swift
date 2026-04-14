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
            
            // 👕 Fashion
            Product(title: "Casual T-Shirt", price: 799, image: "https://images.unsplash.com/photo-1521572163474-6864f9cf17ab", description: "Comfortable cotton t-shirt", category: "Fashion"),
            
            Product(title: "Denim Jacket", price: 2499, image: "https://images.unsplash.com/photo-1543076447-215ad9ba6923", description: "Stylish denim jacket", category: "Fashion"),
            
            Product(title: "Summer Dress", price: 1899, image: "https://images.unsplash.com/photo-1496747611176-843222e1e57c", description: "Lightweight summer dress", category: "Fashion"),
            
            Product(title: "Hoodie", price: 1599, image: "https://images.unsplash.com/photo-1556821840-3a63f95609a7", description: "Warm hoodie", category: "Fashion"),

            // 💄 Beauty
            Product(title: "Lipstick Set", price: 999, image: "https://images.unsplash.com/photo-1586495777744-4413f21062fa", description: "Matte finish lipsticks", category: "Beauty"),
            
            Product(title: "Face Serum", price: 1299, image: "https://images.unsplash.com/photo-1608248597279-f99d160bfcbc", description: "Glowing skin serum", category: "Beauty"),
            
            Product(title: "Perfume", price: 1999, image: "https://images.unsplash.com/photo-1523293182086-7651a899d37f", description: "Long-lasting fragrance", category: "Beauty"),
            
            Product(title: "Makeup Kit", price: 2999, image: "https://images.unsplash.com/photo-1512496015851-a90fb38ba796", description: "Complete makeup kit", category: "Beauty"),

            // 💻 Electronics
            Product(title: "Wireless Headphones", price: 3499, image: "https://images.unsplash.com/photo-1518444065439-e933c06ce9cd", description: "Noise cancelling headphones", category: "Electronics"),
            
            Product(title: "Smart Watch", price: 4999, image: "https://images.unsplash.com/photo-1516574187841-cb9cc2ca948b", description: "Fitness tracking watch", category: "Electronics"),
            
            Product(title: "Bluetooth Speaker", price: 2199, image: "https://images.unsplash.com/photo-1585386959984-a4155224a1ad", description: "Portable speaker", category: "Electronics"),
            
            Product(title: "Laptop Stand", price: 1499, image: "https://images.unsplash.com/photo-1587202372775-e229f172b9d7", description: "Ergonomic stand", category: "Electronics"),

            // 🏠 Home
            Product(title: "Table Lamp", price: 1299, image: "https://images.unsplash.com/photo-1507473885765-e6ed057f782c", description: "Modern lamp", category: "Home"),
            
            Product(title: "Wall Decor", price: 999, image: "https://images.unsplash.com/photo-1505691938895-1758d7feb511", description: "Stylish wall art", category: "Home"),
            
            Product(title: "Cushion Set", price: 799, image: "https://images.unsplash.com/photo-1586105251261-72a756497a11", description: "Soft cushions", category: "Home"),
            
            Product(title: "Plant Pot", price: 599, image: "https://images.unsplash.com/photo-1501004318641-b39e6451bec6", description: "Indoor plant pot", category: "Home"),

            // 👜 Accessories
            Product(title: "Handbag", price: 1999, image: "https://images.unsplash.com/photo-1584917865442-de89df76afd3", description: "Leather handbag", category: "Accessories"),
            
            Product(title: "Sunglasses", price: 899, image: "https://images.unsplash.com/photo-1511499767150-a48a237f0083", description: "UV protected shades", category: "Accessories"),
            
            Product(title: "Watch", price: 2499, image: "https://images.unsplash.com/photo-1523275335684-37898b6baf30", description: "Classic wrist watch", category: "Accessories"),
            
            Product(title: "Backpack", price: 1799, image: "https://images.unsplash.com/photo-1509762774605-f07235a08f1f", description: "Travel backpack", category: "Accessories"),

            // 👟 Footwear
            Product(title: "Running Shoes", price: 2999, image: "https://images.unsplash.com/photo-1542291026-7eec264c27ff", description: "Comfort running shoes", category: "Footwear"),
            
            Product(title: "Sneakers", price: 2599, image: "https://images.unsplash.com/photo-1528701800489-20be9c3aef33", description: "Casual sneakers", category: "Footwear"),
            
            Product(title: "Sandals", price: 999, image: "https://images.unsplash.com/photo-1600185365926-3a2ce3cdb9eb", description: "Summer sandals", category: "Footwear"),
            
            Product(title: "Formal Shoes", price: 3499, image: "https://images.unsplash.com/photo-1614252235316-8c857d38b5f4", description: "Office wear shoes", category: "Footwear")
        ]
    }
}
