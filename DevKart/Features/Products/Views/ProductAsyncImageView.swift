//
//  ProductAsyncImageView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 14/04/26.
//


import SwiftUI

struct ProductAsyncImageView: View {
    
    let imageName: String
    
    var body: some View {
        if imageName.starts(with: "http") {
            
            AsyncImage(url: URL(string: imageName)) { phase in
                switch phase {
                case .success(let image):
                    image
                        .resizable()
                        .scaledToFill()
                        .aspectRatio(contentMode: .fill)
                    
                case .failure(_):
                    Image(systemName: "photo")
                        .resizable()
                        .scaledToFit()
                        .padding()
                        .foregroundColor(.gray)
                    
                default:
                    ProgressView()
                }
            }
            
        } else {
            Image(imageName)
                .resizable()
                .scaledToFill()
        }
    }
}
