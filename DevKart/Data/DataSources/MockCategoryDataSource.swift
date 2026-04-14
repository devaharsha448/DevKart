//
//  MockCategoryDataSource.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 06/04/26.
//


final class MockCategoryDataSource: CategoryDataSource {
    
    func getCategories() async throws -> [Category] {
        
        try await Task.sleep(nanoseconds: 500_000_000) // simulate delay
        
        return [
                Category(name: "Fashion", icon: "tshirt"),
                Category(name: "Beauty", icon: "sparkles"),
                Category(name: "Electronics", icon: "laptopcomputer"),
                Category(name: "Home", icon: "house"),
                Category(name: "Accessories", icon: "bag"),
                Category(name: "Footwear", icon: "shoe")
            ]
    }
}
