//
//  Product+Mappers.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import Foundation

extension Product {
    init(with dto: ProductDTO) throws {
        guard let id = dto.id else {
            throw Self.MappingError.invalidID
        }
        guard let productTypeDTO = dto.type else {
            throw Self.MappingError.invalidType
        }
        guard let name = dto.name else {
            throw Self.MappingError.invalidName
        }
        guard let shortDescription = dto.shortDescription else {
            throw Self.MappingError.emptyShortDescription
        }
        guard let description = dto.description else {
            throw Self.MappingError.emptyDescription
        }
        guard let price = dto.price else {
            throw Self.MappingError.invalidPrice
        }
        guard let imageName = dto.imageName else {
            throw Self.MappingError.invalidImageName
        }
        
        self.id = id
        self.type = try .init(with: productTypeDTO)
        self.name = name
        self.shortDescription = shortDescription
        self.description = description
        self.price = price
        self.imageName = imageName
    }
}
