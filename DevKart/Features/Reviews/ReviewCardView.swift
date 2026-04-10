//
//  ReviewCardView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 06/04/26.
//

import SwiftUI

struct ReviewCardView: View {
    
    let name: String
    let rating: Int
    let comment: String
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            Text(name)
                .font(.subheadline.bold())
            
            HStack {
                ForEach(0..<rating, id: \.self) { _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
            
            Text(comment)
                .font(.caption)
                .foregroundColor(.gray)
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(10)
        .padding(.horizontal) 
    }
}
