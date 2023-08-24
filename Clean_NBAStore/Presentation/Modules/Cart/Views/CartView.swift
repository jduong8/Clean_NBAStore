//
//  CartView.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import SwiftUI

struct CartView: View {
    
    @ObservedObject var cartViewModel: CartViewModel
    private var shouldEnableOrderButton: Bool {
        self.cartViewModel.totalQuantity > 0
    }
    
    var body: some View {
        VStack {
            ScrollView(.vertical, showsIndicators: false) {
                LazyVStack {
                    ForEach($cartViewModel.purchases, id: \.id) { $purchase in
                        CartCellView(purchase: $purchase)
                    }
                }
            }
            Spacer()
            VStack {
                HStack {
                    Text("Quantity: \(cartViewModel.totalQuantity)")
                    Spacer()
                    Text("Total:  \(cartViewModel.totalPrice, specifier: "%.2f") €")
                }
                .padding(.horizontal)
                .padding()
                Button {
                    // Order action
                } label: {
                    Text("Command")
                        .font(.title2)
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .padding(.vertical)
                        .frame(width: UIScreen.main.bounds.width - 30)
                        .background(Color.black)
                        .cornerRadius(5)
                }
                .opacity(!shouldEnableOrderButton ? 0.5 : 1)
                .disabled(!shouldEnableOrderButton)

            }
        }
    }
}

struct CartView_Previews: PreviewProvider {
    static var previews: some View {
        CartView(cartViewModel: .init())
    }
}
