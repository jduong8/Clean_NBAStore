//
//  ViewModelProductListTests.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 25/08/2023.
//

import Foundation

class ViewModelProductListTests: ObservableObject {
    
    private let mockProductRepository: MockProductRepository
    
    // MARK: - Computed Properties
    var products: [Product] {
        do {
            return try mockProductRepository.getAllProducts()
        } catch {
            return []
        }
    }
    
    // MARK: - Initializer
    init(mockProductRepository: MockProductRepository = MockProductRepositoryDefault()) {
        self.mockProductRepository = mockProductRepository
    }
}
