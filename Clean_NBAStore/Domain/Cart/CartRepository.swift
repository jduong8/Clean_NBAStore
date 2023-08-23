//
//  CartRepository.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 23/08/2023.
//

import Foundation

protocol CartRepository {
    func addToCart(purchase: Purchase)
    func removeFromCart(purchase: Purchase)
    func getCartItems() -> [Purchase]
}
