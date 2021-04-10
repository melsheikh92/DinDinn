//
//  AllDishesUseCase.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 10/04/2021.
//

import Foundation
import RxSwift
import DinDinnCore

class AllDishesUseCase {
    let bag = DisposeBag()
    
    func getAllDishes(completion: @escaping (Result<[FoodItemDto], Error>) -> Void) {
        FoodRepository().getFoodAndDrinks()
            .subscribe(onSuccess: { result in
                completion(.success(result))
            }, onError: { error in
                completion(.failure(error))
            }).disposed(by: bag)
    }
}
