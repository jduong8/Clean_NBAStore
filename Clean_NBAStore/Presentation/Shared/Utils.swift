//
//  Utils.swift
//  Clean_NBAStore
//
//  Created by Jonathan Duong on 23/08/2023.
//

import Foundation

func getEUPrice(_ value: Double) -> String {
    let format = NumberFormatter()
    format.numberStyle = .currency
    format.locale = .init(identifier: "eu_FR_POSIX")
    
    return format.string(from: NSNumber(value: value)) ?? ""
}
