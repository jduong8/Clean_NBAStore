//
//  CartRepositoryDefault.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 23/08/2023.
//

import Foundation

class CartRepositoryDefault: CartRepository {
    
    private var cart: [Purchase] = []
    
    func addToCart(purchase: Purchase) {
        if let index = cart.firstIndex(where: { $0.product.id == purchase.product.id && $0.size == purchase.size }) {
            let oldPurchase = cart.first { $0.product.id == purchase.product.id && $0.size == purchase.size }!
            let newPurchase = Purchase(quantity: oldPurchase.quantity + purchase.quantity, product: oldPurchase.product, size: oldPurchase.size)
            cart.remove(at: index)
            cart.append(newPurchase)
        } else {
            cart.append(purchase)
        }
    }
    
    func removeFromCart(purchase: Purchase) {
        if let index = cart.firstIndex(where: { $0.product.id == purchase.product.id && $0.size == purchase.size }) {
            cart.remove(at: index)
        }
    }
    
    func getCartItems() -> [Purchase] {
        return cart
    }
}
