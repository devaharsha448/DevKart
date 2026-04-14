//
//  AccountRow.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 08/04/26.
//
import SwiftUI

struct AccountRow: View {
    
    let title: String
    let icon: String
    let arrow = "chevron.right"
    
    var body: some View {
        HStack {
            Image(systemName: icon)
            Text(title)
            Spacer()
            Image(systemName: arrow)
                .foregroundColor(.gray)
        }
        .foregroundColor(.primary)  
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(10)
    }
}
