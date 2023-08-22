//
//  Product.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import Foundation

struct Product: Identifiable {
    var id: Int
    var type: ProductType
    var name: String
    var shortDescription: String
    var description: String
    var price: Double
    var imageName: String
}
