//
//  ViewModelCart.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 25/08/2023.
//

import Foundation

class ViewModelCart: ObservableObject {
    
    @Published var cart: [Purchase] = []
   
    private var mockCartRepository: MockCartRepository
    
    init(mockCartRepository: MockCartRepository = MockCartRepositoryDefault()) {
        self.mockCartRepository = mockCartRepository
        self.cart = mockCartRepository.getCartItems()  // Charger les articles existants du panier au démarrage
    }
    
    // MARK: - Functions
    func addToCart(for purchase: Purchase) {
        let localPurchase = purchase
        mockCartRepository.addToCart(purchase: localPurchase)
        self.cart = mockCartRepository.getCartItems() // Mettre à jour les articles du panier
    }
    
    func removeFromCart(for purchase: Purchase) {
        let localPurchase = purchase
        mockCartRepository.removeFromCart(purchase: localPurchase)
        self.cart = mockCartRepository.getCartItems() // Mettre à jour les articles du panier
    }
}
