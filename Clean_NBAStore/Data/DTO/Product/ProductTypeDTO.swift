//
//  ProductTypeDTO.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import Foundation

enum ProductTypeDTO: Codable {
    case tshirt
    case hat
    case pants
    case hoodie
    case `short`
    
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
    
    func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        
        switch self {
        case .tshirt:
            try container.encode("tshirt")
        case .hat:
            try container.encode("hat")
        case .pants:
            try container.encode("pants")
        case .hoodie:
            try container.encode("hoodie")
        case .short:
            try container.encode("short")
        }
    }
}
