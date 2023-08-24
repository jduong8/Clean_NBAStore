//
//  QuantitySelectorView.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import SwiftUI

struct QuantitySelectorView: View {
    
    @Binding var purchase: Purchase
    @EnvironmentObject var cartViewModel: CartViewModel
    
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
        Button {
            self.cartViewModel.removeFromCart(for: purchase)
        } label: {
            Image(systemName: "minus.circle")
        }
    }
    
    var incrementButton: some View {
        Button {
            self.cartViewModel.addToCart(for: purchase)
        } label: {
            Image(systemName: "plus.circle")
        }
    }
    
    var quantityText: some View {
        Text("\(self.purchase.quantity)")
    }
}
