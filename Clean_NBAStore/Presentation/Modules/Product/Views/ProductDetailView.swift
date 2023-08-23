//
//  ProductDetailView.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import SwiftUI

struct ProductDetailView: View {

    let product: Product
    @State private var selectedSize: ProductSize = .m
    @EnvironmentObject var cartViewModel: CartViewModel
    
    private var price: String {
        getPrice(self.product.price)
    }
    
    var body: some View {
        VStack {
            Image(product.imageName)
                .resizable()
                .frame(maxWidth: .infinity, alignment: .center)
            VStack(alignment: .leading) {
                Text(product.name)
                    .font(.title)
                    .foregroundColor(.black)
                    .fontWeight(.heavy)
                ScrollView {
                    Text(product.description)
                        .foregroundColor(.black)
                        .frame(maxWidth: .infinity, alignment: .center)
                }
            }
            .padding()
            
            Picker("Size", selection: $selectedSize) {
                ForEach(ProductSize.allCases) { size in
                    Text(size.rawValue.uppercased())
                        .tag(size)
                }
            }
            .pickerStyle(SegmentedPickerStyle())
            .padding()

            Button {
                self.cartViewModel.addToCard(for: Purchase(product: product, size: selectedSize))
            } label: {
                Text("Buy in size \(selectedSize.rawValue.uppercased()) : \(price)")
                    .font(.title2)
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background(Color.black)
                    .cornerRadius(5)
            }
            .padding(.horizontal)
        }
    }
}

struct ProductDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ProductDetailView(
            product: .mockProduct,
            cartViewModel: .init())
        .environmentObject(CartViewModel())
    }
}

extension ProductDetailView {
    func getPrice(_ value: Double) -> String {
        let format = NumberFormatter()
        format.numberStyle = .currency
        format.locale = .init(identifier: "eu_FR_POSIX")
        
        return format.string(from: NSNumber(value: value)) ?? ""
    }
}
