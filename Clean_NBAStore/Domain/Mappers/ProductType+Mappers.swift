//
//  ProductType+Mappers.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import Foundation

extension ProductType {
    init(with dtoType: ProductTypeDTO) {
        switch dtoType {
        case .tshirt:
            self = .tshirt
        case .hat:
            self = .hat
        case .pants:
            self = .pants
        case .hoodie:
            self = .hoodie
        case .short:
            self = .short
        }
    }
}
