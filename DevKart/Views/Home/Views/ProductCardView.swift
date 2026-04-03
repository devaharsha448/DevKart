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
        VStack(alignment: .leading) {
            
            Image(product.image)
                .resizable()
                .scaledToFill()
                .frame(height: 120)
                .clipped()
                .cornerRadius(12)
            
            Text(product.title)
                .font(.subheadline)
            
            Text("$\(product.price, specifier: "%.2f")")
                .font(.headline)
        }
    }
}
