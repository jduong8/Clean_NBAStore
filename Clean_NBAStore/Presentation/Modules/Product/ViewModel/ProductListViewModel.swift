//
//  ProductListViewModel.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import Foundation

class ProductListViewModel: ObservableObject {
    
    private let productRepository: ProductRepository
    
    var products: [Product] {
        do {
            let products = try productRepository.getAllProducts()
            return products
        } catch {
            return []
        }
    }
    
    init(productRepository: ProductRepository = ProductRepositoryDefault()) {
        self.productRepository = productRepository
    }
}
