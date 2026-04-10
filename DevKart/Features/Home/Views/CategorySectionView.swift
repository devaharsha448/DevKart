//
//  CategorySectionView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//

import SwiftUI
struct CategorySectionView: View {
    
    let categories: [Category]
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text("Category")
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(categories) { category in
                        CategoryItemView(category: category)
                    }
                }
            }
        }
    }
}
