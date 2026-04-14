//
//  HomeView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//


import SwiftUI

struct HomeView: View {
    
    @State private var showFilter = false
    @StateObject private var vm = HomeViewModel(
        productRepo: ProductRepositoryImpl(
            dataSource: MockProductDataSource()
        ),
        categoryRepo: CategoryRepositoryImpl(
            dataSource: MockCategoryDataSource()
        )
    )
    
    
    var body: some View {
        NavigationStack {
            ScrollView {
                VStack(spacing: 20) {
                    
                    HeaderView()
                    
                    SearchBarView(
                        text: $vm.searchText,
                        showFilter: $showFilter
                    )
                    .sheet(isPresented: $showFilter) {
                        FilterView(vm: vm)
                    }
                    
                    BannerView()
                    
                    CategorySectionView(
                        categories: vm.categories,
                        selectedCategory: vm.selectedCategory,
                        onSelect: { vm.selectCategory($0) }
                    )
                    if vm.isLoading {
                        ProgressView()
                    }

                    if let error = vm.errorMessage {
                        Text(error)
                            .foregroundColor(.red)
                    }
                    
                    FilterChipsView(
                        selected: vm.selectedFilter,
                        onSelect: { vm.selectedFilter = $0 }
                    )
                    
                    ProductGridView(products: vm.products)
                }
                .padding()
            }
            .task{
                await vm.loadData()
            }
            .navigationBarHidden(true)
        }
    }
}

#Preview {
    HomeView()
}
