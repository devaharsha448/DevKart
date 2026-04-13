//
//  ProductInfoView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 06/04/26.
//
import SwiftUI

struct ProductInfoView: View {
    
    let product: Product
    @EnvironmentObject var cartManager: CartManager
    @Environment(\.modelContext) var context
    @State private var showAlert = false
    @EnvironmentObject var authVM: AuthViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text(product.title)
                .font(.title2.bold())
            
            Text("$\(product.price, specifier: "%.2f")")
                .font(.title)
                .foregroundColor(.brown)
            
            HStack {
                Image(systemName: "star.fill")
                    .foregroundColor(.yellow)
                Text("4.5 (120 reviews)")
                    .font(.subheadline)
            }
        
            Button {
                if let user = authVM.user {
                    cartManager.addToCart(product: product, user: user, context: context)
                }
                    showAlert = true
                }
            label: {
                Text(AppStrings.addedCartMsg)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .alert(AppStrings.addedCartMsg, isPresented: $showAlert) {
                Button(AppStrings.ok, role: .cancel) { }
            } message: {
                Text("\(product.title) \(AppStrings.addedCartInfo)")
            }
            .tint(.brown)   
            
            Text("Description")
                .font(.headline)
            
            Text(product.description)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}
