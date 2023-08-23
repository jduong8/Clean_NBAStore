//
//  ProductTypeDTO.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import Foundation

enum ProductTypeDTO: Decodable {
    case tshirt
    case hat
    case pants
    case hoodie
    case short
    
    enum CodingKeys: String, CodingKey {
        case tshirt, hat, pants, hoodie, short
    }
    
    init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        let typeString = try container.decode(String.self)
        
        switch typeString {
        case "tshirt":
            self = .tshirt
        case "hat":
            self = .hat
        case "pants":
            self = .pants
        case "hoodie":
            self = .hoodie
        case "short":
            self = .short
        default:
            throw DecodingError.dataCorrupted(
                .init(
                    codingPath: container.codingPath,
                    debugDescription: "Unable to decode ProductTypeDTO"
                )
               )
        }
    }
}
