//
//  QuantitySelectorView.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import SwiftUI

struct QuantitySelectorView: View {
    
    @Binding var purchase: Purchase

    // MARK: - Computed Properties
    var isMinusEnabled: Bool {
        self.purchase.quantity > 1
    }
    
    var isPlusEnabled: Bool {
        self.purchase.quantity < 10
    }
    
    // MARK: - Body
    var body: some View {
        HStack {
            decrementButton
            quantityText
            incrementButton
        }
    }
}

struct QuantitySelectorView_Previews: PreviewProvider {
    static var previews: some View {
        QuantitySelectorView(purchase: .constant(.mockPurchase))
    }
}

// MARK: - Subviews
private extension QuantitySelectorView {
    
    var decrementButton: some View {
        Button(action: decrementQuantity) {
            Image(systemName: "minus.circle")
        }
        .disabled(!isMinusEnabled)
    }
    
    var incrementButton: some View {
        Button(action: incrementQuantity) {
            Image(systemName: "plus.circle")
        }
        .disabled(!isPlusEnabled)
    }
    
    var quantityText: some View {
        Text("\(self.purchase.quantity)")
    }
}

// MARK: - Actions
private extension QuantitySelectorView {
    
    func decrementQuantity() {
        self.purchase.quantity = max(self.purchase.quantity - 1, 1)
    }
    
    func incrementQuantity() {
        self.purchase.quantity = min(self.purchase.quantity + 1, 10)
    }
}
