//
//  FoorRepository.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 10/04/2021.
//

import Foundation
import RxSwift
import Moya

public class FoodRepository {
    public init() {
        // Empty constructor
    }
    let provider = MoyaProvider<FoodService>(requestClosure: MoyaProvider<FoodService>.interceptorMapper)
    
    public func getFoodAndDrinks() -> Single<[FoodItemDto]> {
        return provider.rx
            .request(FoodService.food)
            .filterSuccessfulStatusAndRedirectCodes()
            .map([FoodItemDto].self)
    }
    
    public func getDiscountOffers() -> Single<[DicountDto]> {
        return provider.rx
            .request(FoodService.discount)
            .filterSuccessfulStatusAndRedirectCodes()
            .map([DicountDto].self)
    }
}
