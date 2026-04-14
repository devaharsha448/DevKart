//
//  AddEditAddressView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 11/04/26.
//


import SwiftUI
import SwiftData

struct AddEditAddressView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    @Environment(\.modelContext) var context
    @Environment(\.dismiss) var dismiss
    
    @StateObject private var addressVM = AddressViewModel()
    
    var address: AddressModel? // nil → Add, non-nil → Edit
    
    @State private var name = AppStrings.empty
    @State private var phone = AppStrings.empty
    @State private var line1 = AppStrings.empty
    @State private var city = AppStrings.empty
    @State private var state = AppStrings.empty
    @State private var pincode = AppStrings.empty
    
    let Save = "Save"
    let editAddressText = "Edit Address"
    let addAddressText = "Add Address"
    let detailsText = "Details"
    let nameText = "Name"
    let phoneText = "Phone"
    let addressText = "Address"
    let cityText = "City"
    let stateText = "State"
    let pincodeText = "Pincode"
    
    var isEdit: Bool { address != nil }
    
    var body: some View {
        NavigationStack {
            Form {
                Section(detailsText) {
                    TextField(nameText, text: $name)
                    TextField(phoneText, text: $phone)
                    TextField(addressText, text: $line1)
                    TextField(cityText, text: $city)
                    TextField(stateText, text: $state)
                    TextField(pincodeText, text: $pincode)
                }
            }
            .navigationTitle(isEdit ?  editAddressText : addAddressText)
            .toolbar {
                Button(Save) {
                    save()
                }
            }
            .onAppear {
                if let address = address {
                    name = address.name
                    phone = address.phone
                    line1 = address.line1
                    city = address.city
                    state = address.state
                    pincode = address.pincode
                }
            }
        }
    }
    
    private func save() {
        guard let user = authVM.user else { return }
        
        if let address = address {
            // EDIT
            addressVM.updateAddress(
                address: address,
                name: name,
                phone: phone,
                line1: line1,
                city: city,
                state: state,
                pincode: pincode,
                context: context
            )
        } else {
            // ADD
            addressVM.addAddress(
                user: user,
                name: name,
                phone: phone,
                line1: line1,
                city: city,
                state: state,
                pincode: pincode,
                context: context
            )
        }
        
        dismiss()
    }
}
