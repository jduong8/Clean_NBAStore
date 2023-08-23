//
//  CartViewModel.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import Foundation

class CartViewModel: ObservableObject, CartManager {
    
    @Published var purchases: [Purchase] = []
    @Published var purchase: Purchase = .mockPurchase
    
    func addToCard(for purchase: Purchase) {
        if let index = purchases.firstIndex(where: { $0.product.id == purchase.product.id && $0.size == purchase.size }) {
            let oldPurchase = purchases.first { $0.product.id == purchase.product.id && $0.size == purchase.size }!
            let newPurchase = Purchase(quantity: oldPurchase.quantity + purchase.quantity, product: oldPurchase.product, size: oldPurchase.size)
            purchases.remove(at: index)
            purchases.append(newPurchase)
        } else {
            purchases.append(purchase)
        }
    }
}

// MARK: - Product
extension CartViewModel {
    var totalPrice: Double {
        self.purchases.map({ $0.product.price }).reduce(0, +)
    }
    var productQuantity: Int {
        self.purchases.map({ $0.quantity }).reduce(0, +)
    }
}
