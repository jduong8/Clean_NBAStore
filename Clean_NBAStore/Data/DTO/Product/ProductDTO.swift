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
}

extension ProductDTO: Decodable {
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
}
