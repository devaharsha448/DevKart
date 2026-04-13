//
//  AddressListView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 11/04/26.
//
import SwiftUI
import SwiftData

struct AddressListView: View {
    
    @EnvironmentObject var authVM: AuthViewModel
    @Environment(\.modelContext) var context
    
    @StateObject private var addressVM = AddressViewModel()
    
    @State private var showAdd = false
    @State private var selectedAddress: AddressModel?
    
    var body: some View {
        VStack {
            
            if let user = authVM.user {
                
                List {
                    
                    ForEach(addressVM.addresses) { address in
                        
                        AddressCardView(address: address)
                            .frame(maxWidth: .infinity)
                            .listRowInsets(EdgeInsets())
                            .listRowBackground(Color.clear)
                            .contentShape(Rectangle()) // 👈 important
                            .onTapGesture {
                                addressVM.setDefault(address, user: user, context: context)
                            }
                            .swipeActions(edge: .trailing) {
                                
                                Button(role: .destructive) {
                                    addressVM.deleteAddress(address, user: user, context: context)
                                } label: {
                                    Label("Delete", systemImage: "trash")
                                }
                                
                                Button {
                                    selectedAddress = address
                                } label: {
                                    Label("Edit", systemImage: "pencil")
                                }
                                .tint(.blue)
                            }
                    }
                    
                }
                .listStyle(.plain)
            }
            
            // ➕ Add Button
            Button {
                showAdd = true
            } label: {
                Text("Add New Address")
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.brown)
                    .foregroundColor(.white)
                    .cornerRadius(12)
            }
            .padding()
        }
        .navigationTitle("My Addresses")
        
        // ➕ ADD SHEET
        .sheet(isPresented: $showAdd) {
            AddEditAddressView()
        }
        
        // ✏️ EDIT SHEET
        .sheet(item: $selectedAddress) { address in
            AddEditAddressView(address: address)
        }
        
        .onAppear {
            if let user = authVM.user {
                addressVM.loadAddresses(for: user)
            }
        }
    }
}
