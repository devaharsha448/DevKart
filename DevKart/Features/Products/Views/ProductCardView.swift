//
//  ProductCardView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//
import SwiftUI

struct ProductCardView: View {
    
    let product: Product
    
    var body: some View {
        NavigationLink {
            ProductDetailView(product: product)
        } label: {
            VStack(alignment: .leading) {
                
                ProductAsyncImageView(imageName: product.image)
                    .frame(height: 120)
                    .clipped()
                    .cornerRadius(12)
                
                Text(product.title)
                    .font(.subheadline)
                    .foregroundColor(.black)
                
                Text("$\(product.price, specifier: "%.2f")")
                    .font(.headline)
                    .foregroundColor(.black)
            }
        }
    }
}
