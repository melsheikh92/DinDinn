//
//  FoodDto.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 10/04/2021.
//

import Foundation

public struct FoodItemDto: Codable {
    let id: Int
    let title, price, details: String
    let gredients: String
    let image: String
    let type: FoodCategoryDto
}
