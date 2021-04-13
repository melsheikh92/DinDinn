//
//  FoorRepository.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 10/04/2021.
//

import Foundation
import Moya

public class FoodRepository {
    public init() {
        // Empty constructor
    }
    let provider = MoyaProvider<FoodService>(requestClosure: MoyaProvider<FoodService>.interceptorMapper, stubClosure: MoyaProvider.delayedStub(1.0), plugins: [NetworkLoggerPlugin(configuration: NetworkLoggerPlugin.Configuration.init( logOptions: NetworkLoggerPlugin.Configuration.LogOptions.verbose))])
    
    public func getFoodAndDrinks(completion: @escaping (Result<[FoodItemDto], Error>) -> Void) {
        provider.request(.food) { result in
            switch result {
            case .success(let response):
                do {
                   let food = try JSONDecoder().decode([FoodItemDto].self, from: response.data) as! [FoodItemDto]
                    completion(.success(food))
                } catch {
                    print(error)
                    completion(.failure(APIError.parsingError))

                }
            case .failure:
                completion(.failure(APIError.somethingWentWrong))
            }
        }
    }
    
    public func getDiscountOffers(completion: @escaping (Result<[DicountDto], Error>) -> Void) {
        provider.request(.discount) { result in
            switch result {
            case .success(let response):
                guard let discounts = try? JSONDecoder().decode([DicountDto].self, from: response.data) as? [DicountDto]
                else {
                    completion(.failure(APIError.parsingError))
                    return
                }
                completion(.success(discounts))
            case .failure:
                completion(.failure(APIError.somethingWentWrong))
            }
        }
    }
}
