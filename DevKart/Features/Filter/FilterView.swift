//
//  FilterView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 14/04/26.
//
import SwiftUI

struct FilterView: View {
    
    @ObservedObject var vm: HomeViewModel
    @Environment(\.dismiss) var dismiss
    
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                
                // 🔽 Sort
                VStack(alignment: .leading) {
                    Text("Sort By")
                        .font(.headline)
                    
                    Picker("Sort", selection: $vm.selectedSort) {
                        ForEach(SortOption.allCases, id: \.self) { option in
                            Text(option.rawValue)
                        }
                    }
                    .pickerStyle(.segmented)
                }
                
                // 💰 Price Range
                VStack(alignment: .leading) {
                    Text("Price Range")
                        .font(.headline)
                    
                    HStack {
                        Text("₹\(Int(vm.minPrice))")
                        Slider(value: $vm.minPrice, in: 0...10000)
                    }
                    
                    HStack {
                        Text("₹\(Int(vm.maxPrice))")
                        Slider(value: $vm.maxPrice, in: 0...10000)
                    }
                }
                
                // 🔄 Reset
                Button("Reset") {
                    vm.selectedSort = .none
                    vm.minPrice = 0
                    vm.maxPrice = 10000
                }
                
                Spacer()
                Button {
                    dismiss() // ✅ no filtering call
                } label: {
                    Text("Apply Filters")
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background(Color.brown)
                        .foregroundColor(.white)
                        .cornerRadius(12)
                }
            }
            .padding()
            .navigationTitle("Filters")
            
        }
    }
}
