//
//  OrderViewModel.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 13/04/26.
//


import SwiftUI
import SwiftData
import Combine

@MainActor
final class OrderViewModel: ObservableObject {
    
    @Published var orders: [OrderModel] = []
    
    private let dataManager = SwiftDataManager()
    
    func loadOrders(for user: UserModel, context: ModelContext) {
        
        let allOrders = dataManager.fetch(OrderModel.self, context: context)
        
        // ✅ IMPORTANT: filter using userId (not relation)
        orders = allOrders
            .filter { $0.user?.id == user.id }
            .sorted { $0.date > $1.date }
    }
}
