//
//  ViewModelCartTests.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 25/08/2023.
//

import Foundation

class ViewModelCartTests: ObservableObject {
    
    @Published var purchases: [Purchase] = []
    @Published var purchase: Purchase = .mockPurchase
    
    private var mockCartRepository: MockCartRepository
    
    init(mockCartRepository: MockCartRepository = MockCartRepositoryDefault()) {
        self.mockCartRepository = mockCartRepository
        self.purchases = mockCartRepository.getCartItems()  // Charger les articles existants du panier au démarrage
    }
    
    // MARK: - Functions
    
    func addToCart(for purchase: Purchase) {
        var localPurchase = purchase
        localPurchase.quantity = min(localPurchase.quantity + 1, 10)
        mockCartRepository.addToCart(purchase: localPurchase)
        self.purchases = mockCartRepository.getCartItems() // Mettre à jour les articles du panier
    }
    
    func removeFromCart(for purchase: Purchase) {
        self.purchase = purchase
        self.purchase.quantity = max(self.purchase.quantity - 1, 0)
        mockCartRepository.removeFromCart(purchase: self.purchase)
        self.purchases = mockCartRepository.getCartItems() // Mettre à jour les articles du panier
    }
}
