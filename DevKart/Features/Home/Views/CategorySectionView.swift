//
//  CategorySectionView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//

import SwiftUI
struct CategorySectionView: View {
    
    let categories: [Category]
    let selectedCategory: String?
    let onSelect: (String) -> Void   // ✅ callback
    let category = "Category"
    
    var body: some View {
        VStack(alignment: .leading) {
            
            Text(category)
                .font(.headline)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 12) {
                    ForEach(categories) { category in
                        CategoryItemView(
                            category: category,
                            isSelected: selectedCategory == category.name
                        )
                        .onTapGesture {
                            onSelect(category.name)
                        }
                    }
                }
            }
        }
    }
}
