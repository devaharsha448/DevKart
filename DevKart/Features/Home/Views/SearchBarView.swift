//
//  SearchBarView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//
import SwiftUI

struct SearchBarView: View {
    
    @State private var text = ""
    let magnifyingGlass = "magnifyingglass"
    let search = "Search"
    let filter = "slider.horizontal.3"
    
    var body: some View {
        HStack(spacing: 10) {
            
          
            HStack {
                Image(systemName: magnifyingGlass)
                    .foregroundColor(.gray)
                
                TextField(search, text: $text)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            
            
           
            Button {
                // action
            } label: {
                Image(systemName: filter)
                    .foregroundColor(.brown)
                    .padding()
                    .background(Color.brown.opacity(0.1))
                    .clipShape(Circle())
            }
        }
//        .padding(.horizontal)
    }
}
