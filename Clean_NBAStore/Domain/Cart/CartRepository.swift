//
//  CartRepository.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 23/08/2023.
//

import Foundation

protocol CartRepository {
    func addToCart(for purchase: Purchase) throws -> [Purchase]
    func getCart() -> [Purchase]
}

enum CartRepositoryError: Error {
    case addToCartFailed
}
