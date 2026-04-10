//
//  ProductGridView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//
import SwiftUI

struct ProductGridView: View {
    
    let products: [Product]
    
    private let columns = [
        GridItem(.flexible()),
        GridItem(.flexible())
    ]
    
    var body: some View {
        LazyVGrid(columns: columns, spacing: 16) {
            ForEach(products) { product in
                ProductCardView(product: product)
            }
        }
    }
}
