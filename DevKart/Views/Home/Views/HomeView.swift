//
//  HomeView.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 02/04/26.
//


import SwiftUI

struct HomeView: View {
    
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
                    
                    SearchBarView()
                    
                    BannerView()
                    
                    CategorySectionView(categories: vm.categories)
                    
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
