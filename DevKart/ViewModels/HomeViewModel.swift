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
    
    init() {
        loadData()
    }
    
    func loadData() {
        categories = [
            Category(name: "Earrings", icon: "earrings"),
            Category(name: "Necklace", icon: "earrings"),
            Category(name: "Bracelet", icon: "earrings"),
            Category(name: "Ring", icon: "earrings")
        ]
        
        products = [
            Product(title: "Golden Ring", price: 320, image: "ring1"),
            Product(title: "Gold Necklace", price: 450, image: "ring2"),
            Product(title: "Bracelet", price: 220, image: "ring1"),
            Product(title: "Earrings", price: 180, image: "ring2")
        ]
    }
}
