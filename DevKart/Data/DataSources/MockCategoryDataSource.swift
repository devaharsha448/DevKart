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
            Category(name: "Earrings", icon: "earrings"),
            Category(name: "Necklace", icon: "Necklace"),
            Category(name: "Bracelet", icon: "bracelet"),
            Category(name: "Ring", icon: "ringCat")
        ]
    }
}
