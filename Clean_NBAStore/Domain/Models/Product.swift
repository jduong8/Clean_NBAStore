//
//  Product.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import Foundation

struct Product: Identifiable, Hashable {
    var id: Int
    var type: ProductType
    var name: String
    var shortDescription: String
    var description: String
    var price: Double
    var imageName: String
    
    static let mockProduct: Product = .init(
        id: 50000,
        type: .tshirt,
        name: "LeBron James Lakers Icon Edition 2020",
        shortDescription: "Maillot Nike NBA Swingman",
        description: "Le maillot Icon Edition incarne le riche héritage de la franchise, ainsi que son identité emblématique, à travers les couleurs audacieuses de l'équipe.Le maillot Nike NBA Swingman Icon Edition des Lakers de Los Angeles s'inspire de la tenue des joueurs professionnels.Il présente une conception classique en tissu à double maille premium et une coupe qui met en valeur les supporters.Ce produit est entièrement fabriqué à partir de fibres de polyester recyclé.",
        price: 99.99,
        imageName: "lebronIconic")
}
