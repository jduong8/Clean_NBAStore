//
//  Product+MappingError.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import Foundation

extension Product {
    enum MappingError: Error {
        case invalidID
        case invalidType
        case invalidName
        case emptyShortDescription
        case emptyDescription
        case invalidPrice
        case invalidImageName
    }
}
