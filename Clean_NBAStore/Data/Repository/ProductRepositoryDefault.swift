//
//  ProductRepositoryDefault.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import Foundation

class ProductRepositoryDefault: ProductRepository {
    
    let api: API
    
    init(api: API = .init()) {
        self.api = api
    }
    
    func getAllProducts() throws -> [Product] {
        return try self.api.getProductsData().map {
            try .init(with: $0)
        }
    }
}
