//
//  CartRepository.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 10/04/2021.
//

import Foundation
import RxSwift
import RxCocoa

class CartRepository {
    private let cartDataWrapper = CartDataWrapper()
    
    public static let shared = CartRepository()
    
    private init() {
        // private constructor
    }
    public func setCartData(data: [FoodItemDto]) {
        cartDataWrapper.setData(data)
    }
    
    public func cartStream() -> Observable<[FoodItemDto]?> {
        return cartDataWrapper.$cartData.rxValue.asObservable()
    }
}
