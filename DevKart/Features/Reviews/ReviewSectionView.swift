//
//  ReviewSectionView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 06/04/26.
//
import SwiftUI

struct ReviewSectionView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 12) {
            
            Text("Reviews")
                .font(.headline)
            
            ReviewCardView(
                name: "John",
                rating: 4,
                comment: "Great product!"
            )
            
            ReviewCardView(
                name: "Alice",
                rating: 5,
                comment: "Loved it!"
            )
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
       
    }
}
