//
//  ProductDetailView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 06/04/26.
//


import SwiftUI

struct ProductDetailView: View {
    
    let product: Product
    
    var body: some View {
        VStack(spacing: 0) {
            
            ProductImageView(product: product)
            
            ScrollView {
                VStack(alignment: .leading, spacing: 16) {
                    
                    ProductInfoView(product: product) .padding()
                    
                    
                    
                    Divider()
                    
                  
                    ReviewSectionView(product: product)
                   

                }
               
            }
        }
        .navigationBarHidden(true)
        .frame(maxWidth: .infinity, alignment: .leading)
    }
}


