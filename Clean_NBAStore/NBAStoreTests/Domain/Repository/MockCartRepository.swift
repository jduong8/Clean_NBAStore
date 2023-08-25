//
//  MockCartRepository.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 25/08/2023.
//

import Foundation

protocol MockCartRepository {
    func addToCart(purchase: Purchase)
    func removeFromCart(purchase: Purchase)
    func getCartItems() -> [Purchase]
}
