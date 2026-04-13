//
//  DSButton.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 09/04/26.
//


import SwiftUI

struct DSButton: View {
    
    let title: String
    var isLoading: Bool = false
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
            ZStack {
                RoundedRectangle(cornerRadius: 12)
                    .fill(Color.brown)
                    .frame(height: 50)
                
                if isLoading {
                    ProgressView()
                        .tint(.white)
                } else {
                    Text(title)
                        .foregroundColor(.white)
                        .fontWeight(.semibold)
                }
            }
        }
        .disabled(isLoading)
    }
}
