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
    
    @State private var name = ""
    @State private var phone = ""
    @State private var line1 = ""
    @State private var city = ""
    @State private var state = ""
    @State private var pincode = ""
    
    var isEdit: Bool { address != nil }
    
    var body: some View {
        NavigationStack {
            Form {
                Section("Details") {
                    TextField("Name", text: $name)
                    TextField("Phone", text: $phone)
                    TextField("Address", text: $line1)
                    TextField("City", text: $city)
                    TextField("State", text: $state)
                    TextField("Pincode", text: $pincode)
                }
            }
            .navigationTitle(isEdit ? "Edit Address" : "Add Address")
            .toolbar {
                Button("Save") {
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