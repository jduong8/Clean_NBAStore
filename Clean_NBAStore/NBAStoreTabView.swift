//
//  NBAStoreTabView.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import SwiftUI

struct NBAStoreTabView: View {

    @State private var cartViewModel = CartViewModel()

    var body: some View {
        TabView {
            ProductListView()
                .tabItem {
                    Text("Magasin")
                    Image(systemName: "house.fill")
                }
            CartView(cartViewModel: cartViewModel)
                .tabItem {
                    Text("Panier")
                    Image(systemName: "cart.fill")
                }
        }
        .environmentObject(cartViewModel)
    }
}

struct NBAStoreTabView_Previews: PreviewProvider {
    static var previews: some View {
        NBAStoreTabView()
    }
}
