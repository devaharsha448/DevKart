//
//  SearchBarView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//
import SwiftUI
import Combine

struct SearchBarView: View {
    
    @Binding var text: String   // ✅ binding from parent
    
    let magnifyingGlass = "magnifyingglass"
    let search = "Search"
    let filter = "slider.horizontal.3"
    @Binding var showFilter: Bool
    
    var body: some View {
        HStack(spacing: 10) {
            
            HStack {
                Image(systemName: magnifyingGlass)
                    .foregroundColor(.gray)
                
                TextField(search, text: $text)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
                
                if !text.isEmpty {
                    Button {
                        text = ""
                    } label: {
                        Image(systemName: "xmark.circle.fill")
                            .foregroundColor(.gray)
                    }
                }
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            
            Button {
                showFilter = true
            } label: {
                Image(systemName: filter)
                    .foregroundColor(.brown)
                    .padding()
                    .background(Color.brown.opacity(0.1))
                    .clipShape(Circle())
            }
        }
    }
}
