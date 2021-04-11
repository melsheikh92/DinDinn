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
//// responsable for saving codable objects (decoding/encoding ) into UserDefaults
/// using rxValue to listen to its changes
@propertyWrapper
public struct UserDefaultsWrapper<Value : Codable> {
    public let key: String
    public let defaultValue: Value
    public var container: UserDefaults = .standard
    public var projectedValue: UserDefaultsWrapper<Value> { return self }

    public var rxValue = BehaviorRelay<Value?>(value: nil)

    public var wrappedValue: Value {
        get {
           let data = container.object(forKey: key)
           return decodeValue(savedObject: data as? Data)
        }
        set {
            encodeAndSave(newValue: newValue)
            rxValue.accept(newValue)
        }
    }
    
    public func load(){
        rxValue.accept(wrappedValue)
    }
    
    private func encodeAndSave(newValue: Value) {
        let encoder = JSONEncoder()
        if let encoded = try? encoder.encode(wrappedValue) {
            container.set(encoded, forKey: key)
            container.synchronize()
        }
    }
    
    private func decodeValue(savedObject: Data?) -> Value {
        guard let savedObject = savedObject else {
            return defaultValue
        }
        let decoder = JSONDecoder()
        if let decodedObject = try? decoder.decode(Value.self, from: savedObject) {
            return decodedObject
        }
        return defaultValue
    }
}
