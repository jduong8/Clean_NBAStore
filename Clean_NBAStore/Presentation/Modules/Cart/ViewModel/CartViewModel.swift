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
        self.purchase = purchase
        cartRepository.addToCart(purchase: self.purchase)
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
    
    // MARK: - Quantity Selector
    func isMinusEnabled(for purchase: Purchase) -> Bool {
        self.purchase = purchase
        return self.purchase.quantity > 1
    }
    
    func isPlusEnabled(for purchase: Purchase) -> Bool {
        self.purchase = purchase
        return self.purchase.quantity < 10
    }
}
