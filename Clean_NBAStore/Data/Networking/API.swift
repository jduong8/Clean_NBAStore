//
//  API.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import Foundation

final class API {
    func getProductsData() -> [ProductDTO] {
        load("products.json")
    }
}
