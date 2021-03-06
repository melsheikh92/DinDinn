//
//  AllDishesUseCase.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 10/04/2021.
//

import Foundation
import DinDinnCore

class AllDishesUseCase {
    
    func getAllDishes(completion: @escaping (Result<[FoodItemDto], Error>) -> Void) {
        FoodRepository()
            .getFoodAndDrinks(completion: { (result) in
                switch result {
                case .success(let discounts):
                    completion(.success(discounts))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
    }
    
    /// this method is to map to Presentation layer model if exists
    func toUIModel(models: [FoodItemDto]) -> [FoodItemDto] {
        return models
    }
}
