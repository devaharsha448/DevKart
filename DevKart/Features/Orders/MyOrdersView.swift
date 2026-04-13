//
//  MyOrdersView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 13/04/26.
//


import SwiftUI
import SwiftData

struct MyOrdersView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    @Environment(\.modelContext) var context
    
    @StateObject private var orderVM = OrderViewModel()
    
    var body: some View {
        VStack {
            
            if let user = authVM.user {
                
                if orderVM.orders.isEmpty {
                    
                    Spacer()
                    
                    VStack(spacing: 10) {
                        Image(systemName: "bag")
                            .font(.largeTitle)
                            .foregroundColor(.gray)
                        
                        Text("No Orders Yet")
                            .font(.headline)
                            .foregroundColor(.gray)
                    }
                    
                    Spacer()
                    
                } else {
                    
                    List {
                        ForEach(orderVM.orders) { order in
                            
                            OrderCardView(order: order)
                                .listRowInsets(EdgeInsets())
                                .listRowBackground(Color.clear)
                        }
                    }
                    .listStyle(.plain)
                }
            }
        }
        .navigationTitle("My Orders")
        .onAppear {
            if let user = authVM.user {
                orderVM.loadOrders(for: user, context: context)
            }
        }
    }
}