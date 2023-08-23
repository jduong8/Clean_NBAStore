//
//  ProductListView.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import SwiftUI

struct ProductListView: View {
    
    @StateObject private var productListVM = ProductListViewModel()

    private static let spacing: CGFloat = 15
    private let columns: [GridItem] = (0..<2).map { _ in
        GridItem(.flexible(), spacing: spacing, alignment: .top)
    }
    
    var body: some View {
        NavigationView {
            ScrollView {
                LazyVGrid(columns: columns, spacing: ProductListView.spacing) {
                    ForEach(productListVM.products) { product in
                        NavigationLink {
                            ProductDetailView(product: product)
                        } label: {
                            ProductCellView(product: product)
                        }

                    }
                }
                .padding()
            }
            .navigationTitle("NBA STORE")
        }
    }
}

struct ProductListView_Previews: PreviewProvider {
    static var previews: some View {
        ProductListView()
    }
}
