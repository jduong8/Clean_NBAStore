//
//  CartViewModel.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import Foundation

class CartViewModel: ObservableObject {
    
    @Published var purchases: [Purchase] = []
    @Published var purchase: Purchase = .initialPurchase
    
    private var cartRepository: CartRepository
    
    init(cartRepository: CartRepository = CartRepositoryDefault()) {
        self.cartRepository = cartRepository
        self.purchases = cartRepository.getCartItems()  // Charger les articles existants du panier au démarrage
    }
    
    // MARK: - Functions
    func addToCart(for purchase: Purchase) {
        let localPurchase = purchase
        cartRepository.addToCart(purchase: localPurchase)
        self.purchases = cartRepository.getCartItems() // Mettre à jour les articles du panier
    }
    
    func removeFromCart(for purchase: Purchase) {
        self.purchase = purchase
        cartRepository.removeFromCart(purchase: self.purchase)
        self.purchases = cartRepository.getCartItems() // Mettre à jour les articles du panier
    }
    
    // MARK: - Display price and quantity
    var totalPrice: Double {
        return purchases.map({ $0.product.price * Double($0.quantity) }).reduce(0, +)
    }
    
    var totalQuantity: Int {
        return purchases.map({ $0.quantity }).reduce(0, +)
    }
}
