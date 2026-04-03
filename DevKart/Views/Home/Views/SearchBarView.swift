//
//  SearchBarView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//
import SwiftUI

struct SearchBarView: View {
    
    @State private var text = ""
    
    var body: some View {
        HStack(spacing: 10) {
            
          
            HStack {
                Image(systemName: "magnifyingglass")
                    .foregroundColor(.gray)
                
                TextField("Search", text: $text)
                    .autocorrectionDisabled()
                    .textInputAutocapitalization(.never)
            }
            .padding()
            .background(Color(.systemGray6))
            .cornerRadius(12)
            
            
           
            Button {
                // action
            } label: {
                Image(systemName: "slider.horizontal.3")
                    .foregroundColor(.brown)
                    .padding()
                    .background(Color.brown.opacity(0.1))
                    .clipShape(Circle())
            }
        }
//        .padding(.horizontal)
    }
}
