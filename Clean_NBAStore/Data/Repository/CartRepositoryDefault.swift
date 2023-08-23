//
//  CartRepositoryDefault.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 23/08/2023.
//

import Foundation

class CartRepositoryDefault: CartRepository {
    
    private var cart: [Purchase] = []
    
    func addToCart(for purchase: Purchase) throws -> [Purchase] {
        
        cart.append(purchase)
        
        return cart
    }
    
    func getCart() -> [Purchase] {
        return cart
    }
}
