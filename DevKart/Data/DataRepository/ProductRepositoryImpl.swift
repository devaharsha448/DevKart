//
//  ProductRepositoryImpl.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 06/04/26.
//
import SwiftUI

final class ProductRepositoryImpl: ProductRepository {
    
    private let dataSource: ProductDataSource
    
    init(dataSource: ProductDataSource) {
        self.dataSource = dataSource
    }
    
    func fetchProducts() async throws -> [Product] {
        return try await dataSource.getProducts()
    }
}
