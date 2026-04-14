//
//  CategoryItemView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//
import SwiftUI

struct CategoryItemView: View {
    
    let category: Category
    let isSelected: Bool
    
    var body: some View {
        VStack(spacing: 6) {
            
            Image(systemName: category.icon)
                .font(.system(size: 18))
            
            Text(category.name)
                .font(.caption2)
                .lineLimit(1)
        }
        .frame(width: 70, height: 70) 
        .background(
            RoundedRectangle(cornerRadius: 12)
                .fill(isSelected ? Color.blue.opacity(0.2) : Color.gray.opacity(0.1))
        )
    }
}
