//
//  ProductCellView.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import SwiftUI

struct ProductCellView: View {

    let product: Product

    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            VStack (alignment: .leading, spacing: 4) {
                Text(product.name)
                    .fontWeight(.heavy)
                    .foregroundColor(.black)
                Text(product.shortDescription)
                    .foregroundColor(.gray)
                Text("6 Tailles")
                    .foregroundColor(.gray)
                Spacer()
                Text("\(product.price, specifier: "%.2f") €")
                    .foregroundColor(.black)
            }
        }
    }
}

struct ProductCellView_Previews: PreviewProvider {
    static var previews: some View {
        ProductCellView(product: .mockProduct)
    }
}
