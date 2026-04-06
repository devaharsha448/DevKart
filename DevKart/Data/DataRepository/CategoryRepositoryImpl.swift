//
//  CategoryRepositoryImpl.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 06/04/26.
//

import SwiftUI
final class CategoryRepositoryImpl: CategoryRepository {
    
    private let dataSource: CategoryDataSource
    
    init(dataSource: CategoryDataSource) {
        self.dataSource = dataSource
    }
    
    func fetchCategories() async throws -> [Category] {
        return try await dataSource.getCategories()
    }
}
