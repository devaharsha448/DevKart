//
//  CategoryItemView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//
import SwiftUI

struct CategoryItemView: View {
    
    let category: Category
    
    var body: some View {
        VStack {
            Image(category.icon)
                .resizable()
                .frame(width: 50, height: 50)
                .clipShape(Circle())
            
            Text(category.name)
                .font(.caption)
        }
    }
}
