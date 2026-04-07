//
//  ProductInfoView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 06/04/26.
//
import SwiftUI

struct ProductInfoView: View {
    
    let product: Product
    
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
                // Add to cart
            } label: {
                Text("Add to Cart")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            
            Text("Description")
                .font(.headline)
            
            Text(product.description)
                .font(.subheadline)
                .foregroundColor(.gray)
        }
    }
}
