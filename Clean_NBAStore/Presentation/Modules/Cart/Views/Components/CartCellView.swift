//
//  CartCellView.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import SwiftUI

struct CartCellView: View {
    
    @Binding var purchase: Purchase
    private var totalPrice: Double {
        purchase.product.price * Double(purchase.quantity)
    }
    
    var body: some View {
        HStack {
            Image(purchase.product.imageName)
                .resizable()
                .frame(width: 120)
                .frame(maxHeight: 115)
            VStack (alignment: .leading){
                Text(purchase.product.name)
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                Text(purchase.product.shortDescription)
                    .foregroundColor(.black)
                    .font(.system(size: 15))
                Text("Size : \(purchase.size.rawValue.uppercased())")
                    .foregroundColor(.black)
                    .opacity(0.3)
                QuantitySelectorView(purchase: $purchase)
                Text("\(totalPrice, specifier: "%.2f") €")
                    .foregroundColor(.black)
            }
        }
    }
}

struct CartCellView_Previews: PreviewProvider {
    static var previews: some View {
        CartCellView(purchase: .constant(.mockPurchase))
    }
}
