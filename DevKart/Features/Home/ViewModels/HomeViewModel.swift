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
    @Published var categories: [Category] = []
    
    @Published var selectedFilter: String = "All"
    @Published var errorMessage: String?
    @Published var isLoading = false
    
    @Published var searchText: String = ""
    @Published var selectedSort: SortOption = .none
    @Published var minPrice: Double = 0
    @Published var maxPrice: Double = 10000
    
    private let productRepo: ProductRepository
    private let categoryRepo: CategoryRepository
    
    init(
        productRepo: ProductRepository,
        categoryRepo: CategoryRepository
    ) {
        self.productRepo = productRepo
        self.categoryRepo = categoryRepo
    }
    
    // ✅ Computed Products (NO STATE MUTATION)
    var products: [Product] {
        var filtered = allProducts.filter { product in
            
            let matchesCategory = selectedCategory == nil || product.category == selectedCategory
            
            let matchesSearch = searchText.isEmpty ||
            product.title.localizedCaseInsensitiveContains(searchText)
            
            let matchesPrice = product.price >= minPrice && product.price <= maxPrice
            
            return matchesCategory && matchesSearch && matchesPrice
        }
        
        switch selectedSort {
        case .priceLowToHigh:
            return filtered.sorted { $0.price < $1.price }
            
        case .priceHighToLow:
            return filtered.sorted { $0.price > $1.price }
            
        default:
            return filtered
        }
    }
    
    func loadData() async {
        isLoading = true
        errorMessage = nil
        
        do {
            async let productsData = productRepo.fetchProducts()
            async let categoriesData = categoryRepo.fetchCategories()
            
            let (products, categories) = try await (productsData, categoriesData)
            
            self.allProducts = products
            self.categories = categories
            
        } catch {
            self.errorMessage = "Failed to load data"
            print(error)
        }
        
        isLoading = false
    }
    
    func selectCategory(_ category: String) {
        if selectedCategory == category {
            selectedCategory = nil
        } else {
            selectedCategory = category
        }
    }
}
