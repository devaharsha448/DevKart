//
//  HomeViewModel.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//
import SwiftUI
import Combine
@MainActor
class HomeViewModel: ObservableObject {
    
    @Published var products: [Product] = []
    @Published var categories: [Category] = []
    @Published var selectedFilter: String = "All"
    
    private let productRepo: ProductRepository
    private let categoryRepo: CategoryRepository
    
    init(
        productRepo: ProductRepository,
        categoryRepo: CategoryRepository
    ) {
        self.productRepo = productRepo
        self.categoryRepo = categoryRepo
    }
    
    func loadData() async {
        do {
            async let products = productRepo.fetchProducts()
            async let categories = categoryRepo.fetchCategories()
            
            self.products = try await products
            self.categories = try await categories
            
        } catch {
            print("Error: \(error)")
        }
    }
}
