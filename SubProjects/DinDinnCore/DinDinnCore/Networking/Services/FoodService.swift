//
//  File.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 09/04/2021.
//

import Foundation
import Moya


public enum FoodService: TargetType {
    
    case food
    case discount
    
    public var baseURL: URL{
        return URL(string: "https://6070c7a450aaea0017283eac.mockapi.io/api")!
    }
    
    public var path: String {
        switch self {
        case .food:
            return "food"
        case .discount:
            return "discount"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .food:
            return Method.get
        case .discount:
            return Method.get
        }
    }
    
    public var sampleData: Data {
        return Data()
    }
    
    public var task: Task {
        switch self {
        case .food, .discount:
            return Task.requestPlain
        }
    }
    
    public var headers: [String : String]? {
        return ["Content-type": "application/json"]
    }
    
}
