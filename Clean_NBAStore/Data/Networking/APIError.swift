//
//  APIError.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import Foundation

enum APIError: Error {
    case parsingError(Error)
    case unknown

    func getErrorMessage() -> String {
        switch self {
        case .parsingError(let error):
            return error.localizedDescription
        case .unknown:
            return "Unknown error"
        }
    }
}

extension APIError: LocalizedError {
    var errorDescription: String? {
        getErrorMessage()
    }
}
