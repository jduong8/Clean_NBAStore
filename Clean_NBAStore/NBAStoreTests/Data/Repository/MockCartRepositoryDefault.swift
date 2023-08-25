//
//  MockCartRepositoryDefault.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 25/08/2023.
//

import Foundation

class MockCartRepositoryDefault: MockCartRepository {
    
    private var cart: [Purchase] = []
    
    func addToCart(purchase: Purchase) {
        if let index = cart.firstIndex(where: { $0.product.id == purchase.product.id && $0.size == purchase.size }) {
            let oldPurchase = cart[index]
            let newPurchase = Purchase(quantity: oldPurchase.quantity + 1, product: oldPurchase.product, size: oldPurchase.size)  // +1 au lieu de + purchase.quantity
            cart[index] = newPurchase
        } else {
            cart.append(purchase)
        }
    }

    
    func removeFromCart(purchase: Purchase) {
        if let index = cart.firstIndex(where: { $0.product.id == purchase.product.id && $0.size == purchase.size }) {
            let oldPurchase = cart[index]
            let newQuantity = oldPurchase.quantity - 1
            if newQuantity == 0 {
                cart.remove(at: index)
            } else {
                let newPurchase = Purchase(quantity: newQuantity, product: oldPurchase.product, size: oldPurchase.size)
                cart[index] = newPurchase
            }
        }
    }

    
    func getCartItems() -> [Purchase] {
        return cart
    }
}
