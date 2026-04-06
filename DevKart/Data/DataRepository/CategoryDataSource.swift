//
//  CategoryDataSource.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 06/04/26.
//

import SwiftUI
protocol CategoryDataSource {
    func getCategories() async throws -> [Category]
}
