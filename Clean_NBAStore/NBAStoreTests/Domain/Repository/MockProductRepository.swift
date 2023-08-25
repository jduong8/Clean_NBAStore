//
//  MockProductRepository.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 25/08/2023.
//

import Foundation


protocol MockProductRepository {
    func getAllProducts() throws -> [Product]
}
