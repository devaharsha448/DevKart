//
//  ProductImageView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 06/04/26.
//
import SwiftUI

struct ProductImageView: View {
    
    let product: Product
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        ZStack(alignment: .top) {
            
            ProductAsyncImageView(imageName: product.image)
                .frame(height: 300)
                .clipped()
            
            HStack {
                
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .padding()
                        .background(.ultraThinMaterial)
                        .clipShape(Circle())
                }
                
                Spacer()
                
                HStack {
                    iconButton("heart")
                    iconButton("square.and.arrow.up")
                }
            }
            .padding()
        }
    }
    
    private func iconButton(_ name: String) -> some View {
        Image(systemName: name)
            .padding()
            .background(.ultraThinMaterial)
            .clipShape(Circle())
    }
}
