//
//  UserDefaultsWrapper.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 10/04/2021.
//

import Foundation
import RxSwift
import RxCocoa
/// Reactive UserDefaults
////
@propertyWrapper
public struct UserDefaultsWrapper<Value> {
    public let key: String
    public let defaultValue: Value
    public var container: UserDefaults = .standard
    public var projectedValue: UserDefaultsWrapper<Value> { return self }

    public var rxValue = BehaviorRelay<Value?>(value: nil)

    public var wrappedValue: Value {
        get {
            return container.object(forKey: key) as? Value ?? defaultValue
        }
        set {
            container.set(newValue, forKey: key)
            container.synchronize()
            rxValue.accept(newValue)
        }
    }
    
    public func load(){
        rxValue.accept(wrappedValue)
    }
}
