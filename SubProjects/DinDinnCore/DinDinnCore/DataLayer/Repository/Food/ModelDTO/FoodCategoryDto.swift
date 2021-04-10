//
//  FoodCategoryDto.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 10/04/2021.
//

import Foundation

public enum FoodCategoryDto: String, Codable, CaseIterable, CaseEnumWithDefaultFirst {
    case unknown
    case pizza  = "PIZZA"
    case sushi  = "SUSHI"
    case drinks = "DRINKS"
    
    static func casesArray() -> [FoodCategoryDto] {
        var cases = FoodCategoryDto.allCases
        cases.removeFirst()
        return cases
    }
}
