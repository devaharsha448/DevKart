//
//  AddressSectionView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 10/04/26.
//
import SwiftUI

struct AddressSectionView: View {
    @EnvironmentObject var authVM: AuthViewModel
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            
            Text("Deliver To")
                .font(.headline)
            
            VStack(alignment: .leading, spacing: 4) {
                if let address = authVM.user?.addresses.first(where: { $0.isDefault }) {
                    
                    Text(address.name)
                    Text(address.line1)
                    Text("\(address.city), \(address.state)")
                    Text(address.pincode)
                    
                } else {
                    Text("No Address Selected")
                }
            }
            .font(.caption)
            
            NavigationLink {
                AddressListView()
            } label: {
                Text("Change Address")
                    .foregroundColor(.brown)
            }
        }
        .padding()
        .frame(maxWidth: .infinity, alignment: .leading)
        .background(Color(.systemGray6))
        .cornerRadius(12)
    }
}
