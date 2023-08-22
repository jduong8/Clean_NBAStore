//
//  ProductRepository.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import Foundation

protocol ProductRepository {
    func getAllProducts() throws -> [Product]
}
