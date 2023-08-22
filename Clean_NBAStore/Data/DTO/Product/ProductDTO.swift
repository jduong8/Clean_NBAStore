//
//  ProductDTO.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import Foundation

struct ProductDTO {
    var id: Int?
    var type: ProductTypeDTO?
    var name: String?
    var shortDescription: String?
    var description: String?
    var price: Double?
    var imageName: String?
    
    enum CodingKeys: String, CodingKey {
        case id, type, name, shortDescription, description, price, imageName
    }
    
    init(
        id: Int? = nil,
        type: ProductTypeDTO? = nil,
        name: String? = nil,
        shortDescription: String? = nil,
        description: String? = nil,
        price: Double? = nil,
        imageName: String? = nil
    ) {
        self.id = id
        self.type = type
        self.name = name
        self.shortDescription = shortDescription
        self.description = description
        self.price = price
        self.imageName = imageName
    }
}

extension ProductDTO: Codable {
    init(from decoder: Decoder) throws {
        let container = try decoder.container(keyedBy: CodingKeys.self)
        
        self.id = try container.decodeIfPresent(Int.self, forKey: .id)
        self.type = try container.decodeIfPresent(ProductTypeDTO.self, forKey: .type)
        self.name = try container.decodeIfPresent(String.self, forKey: .name)
        self.shortDescription = try container.decodeIfPresent(String.self, forKey: .shortDescription)
        self.description = try container.decodeIfPresent(String.self, forKey: .description)
        self.price = try container.decodeIfPresent(Double.self, forKey: .price)
        self.imageName = try container.decodeIfPresent(String.self, forKey: .imageName)
    }
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.container(keyedBy: CodingKeys.self)
        
        try container.encodeIfPresent(id, forKey: .id)
        try container.encodeIfPresent(type, forKey: .type)
        try container.encodeIfPresent(name, forKey: .name)
        try container.encodeIfPresent(shortDescription, forKey: .shortDescription)
        try container.encodeIfPresent(description, forKey: .description)
        try container.encodeIfPresent(price, forKey: .price)
        try container.encodeIfPresent(imageName, forKey: .imageName)
    }
}
