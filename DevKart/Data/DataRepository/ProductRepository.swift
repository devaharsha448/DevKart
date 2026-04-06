//
//  ProductRepository.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 06/04/26.
//
import SwiftUI

protocol ProductRepository {
    func fetchProducts() async throws -> [Product]
}
