//
//  ProductSize.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 22/08/2023.
//

import Foundation

enum ProductSize: String, CaseIterable, Identifiable {
    case xs
    case s
    case m
    case l
    case xl
    case xxl
    
    var id: String { self.rawValue }
}
