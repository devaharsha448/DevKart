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
    @Published var selectedCategory: String? = nil
    @Published var allProducts: [Product] = []
    @Published var products: [Product] = []
    @Published var categories: [Category] = []
    @Published var selectedFilter: String = "All"
    @Published var errorMessage: String?
    @Published var isLoading = false
    
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
        isLoading = true
        errorMessage = nil
        
        do {
            async let productsData = productRepo.fetchProducts()
            async let categoriesData = categoryRepo.fetchCategories()
            
            let (products, categories) = try await (productsData, categoriesData)
            
            self.allProducts = products
            self.products = products
            self.categories = categories
            
        } catch {
            self.errorMessage = "Failed to load data"
            print(error)
        }
        
        isLoading = false
    }
    
    func filterProducts() {
        if let selectedCategory {
            products = allProducts.filter {
                $0.category == selectedCategory
            }
        } else {
            products = allProducts
        }
    }
    
    func selectCategory(_ category: String) {
        if selectedCategory == category {
            selectedCategory = nil // toggle off
        } else {
            selectedCategory = category
        }
        
        filterProducts()
    }
}
