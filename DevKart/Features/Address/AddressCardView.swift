//
//  AddressCardView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 11/04/26.
//


import SwiftUI

struct AddressCardView: View {
    
    let address: AddressModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 6) {
            
            HStack {
                Text(address.name)
                    .font(.headline)
                
                if address.isDefault {
                    Text("Default")
                        .font(.caption)
                        .padding(6)
                        .background(Color.green.opacity(0.2))
                        .cornerRadius(6)
                }
            }
            
            Text(address.line1)
            Text("\(address.city), \(address.state)")
            Text(address.pincode)
            Text("Phone: \(address.phone)")
        }
        .frame(maxWidth: .infinity, alignment: .leading) 
        .padding()
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
