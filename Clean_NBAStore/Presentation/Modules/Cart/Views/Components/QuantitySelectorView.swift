//
//  QuantitySelectorView.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import SwiftUI

struct QuantitySelectorView: View {
    
    // MARK: - Properties
    @Binding var quantity: Int
//    @ObservedObject var cartViewModel: CartViewModel
    
    // MARK: - Computed Properties
    var isMinusEnabled: Bool {
        self.quantity > 1
    }
    
    var isPlusEnabled: Bool {
        self.quantity < 10
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
        QuantitySelectorView(quantity: .constant(1))
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
        Text("\(self.quantity)")
    }
}

// MARK: - Actions
private extension QuantitySelectorView {
    
    func decrementQuantity() {
        self.quantity = max(self.quantity - 1, 1)
    }
    
    func incrementQuantity() {
        self.quantity = min(self.quantity + 1, 10)
    }
}
