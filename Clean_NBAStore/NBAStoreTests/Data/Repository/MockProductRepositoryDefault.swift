//
//  MockProductRepositoryDefault.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 25/08/2023.
//

import Foundation

class MockProductRepositoryDefault: MockProductRepository {
    
    var mockProducts: [Product] = []
    var errorToThrow: ProductError?
    
    func getAllProducts() throws -> [Product] {
        if let error = errorToThrow {
            throw error
        }
        return mockProducts
    }
}

extension MockProductRepositoryDefault {
    enum ProductError: Error {
        case noProductsAvailable
        case networkError
    }
}
