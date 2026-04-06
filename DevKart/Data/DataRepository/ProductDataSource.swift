//
//  ProductDataSource.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 06/04/26.
//

import SwiftUI
protocol ProductDataSource {
    func getProducts() async throws -> [Product]
}
