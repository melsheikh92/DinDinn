//
//  FoodDto.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 10/04/2021.
//

import Foundation

public struct FoodItemDto: Codable {
    public let id: Int
    public let title, price, details : String
    public let image: String
    public var gredients: String?
    public let type: String
     
    public func getCategory() -> FoodCategoryDto? {
       return FoodCategoryDto(rawValue: type)
    }
}
