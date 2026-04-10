//
//  FilterChipsView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//

import SwiftUI
struct FilterChipsView: View {
    
    let filters = ["All", "Newest", "Popular", "Best"]
    
    var selected: String
    var onSelect: (String) -> Void
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(filters, id: \.self) { filter in
                    FilterChipView(
                        title: filter,
                        isSelected: selected == filter,
                        onTap: {
                            onSelect(filter)
                        }
                    )
                }
            }
        }
    }
}
