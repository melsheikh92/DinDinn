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
        FoodRepository().getDiscountOffers()
            .map({ self.toUIModel(models: $0) })
            .subscribe(onSuccess: { result in
                completion(.success(result))
            }, onError: { error in
                completion(.failure(error))
            }).disposed(by: bag)
    }
    /// this method is to map to Presentation layer model if exists
    func toUIModel(models: [DicountDto]) -> [DicountDto] {
        return models
    }
}
