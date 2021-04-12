//
//  SlidersOffersUsecase.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 10/04/2021.
//

import Foundation
import RxSwift
import DinDinnCore

class SlidersOffersUsecase {
    let bag = DisposeBag()
    
    func getSlidersOffers(completion: @escaping (Result<[DicountDto], Error>) -> Void) {
        FoodRepository()
            .getDiscountOffers (completion: { (result) in
                switch result {
                case .success(let discounts):
                    completion(.success(discounts))
                case .failure(let error):
                    completion(.failure(error))
                }
            })
    }
    /// this method is to map to Presentation layer model if exists
    func toUIModel(models: [DicountDto]) -> [DicountDto] {
        return models
    }
}
