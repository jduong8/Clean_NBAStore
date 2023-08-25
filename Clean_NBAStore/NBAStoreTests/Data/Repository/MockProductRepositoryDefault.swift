//
//  MockProductRepositoryDefault.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 25/08/2023.
//

import Foundation

class MockProductRepositoryDefault: MockProductRepository {
    
    let api: API
    
    init(api: API = .init()) {
        self.api = api
    }
    
    func getAllProducts() throws -> [Product] {
        return try self.api.getProductsData().map {
            try Product(with: $0)
        }
    }
}
