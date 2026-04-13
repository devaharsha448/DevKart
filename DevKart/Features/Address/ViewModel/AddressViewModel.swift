//
//  AddAddressView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 11/04/26.
//


import SwiftUI
import SwiftData
import Combine

@MainActor
final class AddressViewModel: ObservableObject {
    
    @Published var addresses: [AddressModel] = []
    
    private let dataManager = SwiftDataManager()
    
    // Load addresses for user
    func loadAddresses(for user: UserModel) {
        addresses = user.addresses
    }
    
    // ADD
    func addAddress(
        user: UserModel,
        name: String,
        phone: String,
        line1: String,
        city: String,
        state: String,
        pincode: String,
        context: ModelContext
    ) {
        let newAddress = AddressModel(
            name: name,
            phone: phone,
            line1: line1,
            city: city,
            state: state,
            pincode: pincode,
            isDefault: user.addresses.isEmpty
        )
        
        newAddress.user = user
        user.addresses.append(newAddress)
        
        dataManager.add(newAddress, context: context)
        try? context.save()
        
        addresses = user.addresses
    }
    
    // DELETE
    func deleteAddress(
        _ address: AddressModel,
        user: UserModel,
        context: ModelContext
    ) {
        user.addresses.removeAll { $0.id == address.id }
        dataManager.delete(address, context: context)
        
        try? context.save()
        addresses = user.addresses
    }
    
    // EDIT
    func updateAddress(
        address: AddressModel,
        name: String,
        phone: String,
        line1: String,
        city: String,
        state: String,
        pincode: String,
        context: ModelContext
    ) {
        address.name = name
        address.phone = phone
        address.line1 = line1
        address.city = city
        address.state = state
        address.pincode = pincode
        
        try? context.save()
        addresses = address.user?.addresses ?? []
    }
    
    // DEFAULT
    func setDefault(
        _ address: AddressModel,
        user: UserModel,
        context: ModelContext
    ) {
        user.addresses.forEach { $0.isDefault = false }
        address.isDefault = true
        
        try? context.save()
        addresses = user.addresses
    }
}
