//
//  CategoryRepository.swift
//  DevKart
//
//  Created by Dumpa Deva Harsha on 06/04/26.
//


protocol CategoryRepository {
    func fetchCategories() async throws -> [Category]
}