//
//  FilterChipView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//
import SwiftUI

struct FilterChipView: View {
    
    let title: String
    let isSelected: Bool
    let onTap: () -> Void
    
    var body: some View {
        Text(title)
            .padding(.horizontal, 12)
            .padding(.vertical, 6)
            .background(isSelected ? Color.brown : Color.gray.opacity(0.2))
            .foregroundColor(isSelected ? .white : .black)
            .cornerRadius(10)
            .onTapGesture {
                onTap()
            }
    }
}
