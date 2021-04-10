//
//  UserDefaults.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 10/04/2021.
//

import Foundation
import RxSwift
import RxCocoa

internal class CartDataWrapper {
    static let defaultsContainer = UserDefaults(suiteName: "dindinn.data")!

    init() {
        $cartData.load()
    }
    
    @UserDefaultsWrapper(key: "dindinn_cart", defaultValue: [], container: defaultsContainer)
    var cartData: [FoodItemDto]
    
    var value:  [FoodItemDto] {
        return cartData
    }
    
    func setData(_ data: [FoodItemDto]){
        cartData = data
    }
    
    var rxValue: BehaviorRelay<[FoodItemDto]?> {
        return $cartData.rxValue
    }
}
