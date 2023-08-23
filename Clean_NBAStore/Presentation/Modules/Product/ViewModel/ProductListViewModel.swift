//
//  ProductListViewModel.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import Foundation

class ProductListViewModel: ObservableObject {
    
    private let productRepository: ProductRepository
    
    // MARK: - Computed Properties
    var products: [Product] {
        do {
            return try productRepository.getAllProducts()
        } catch {
            return []
        }
    }
    
    // MARK: - Initializer
    init(productRepository: ProductRepository = ProductRepositoryDefault()) {
        self.productRepository = productRepository
    }
}
