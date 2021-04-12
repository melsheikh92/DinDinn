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
        return URL(string: "https://api.dindinn.com")!
    }
    
    public var path: String {
        switch self {
        case .food:
            return "/food"
        case .discount:
            return "/discount"
        }
    }
    
    public var method: Moya.Method {
        switch self {
        case .food:
            return .get
        case .discount:
            return .get
        }
    }
    
    public var sampleData: Data {
        switch self {
        case .food:
            return foodResponse.data(using: String.Encoding.utf8) ?? Data()
        case .discount:
            return discountsResponse.data(using: String.Encoding.utf8) ?? Data()
        }
    }
    
    public var task: Task {
        switch self {
        case .food, .discount:
            return Task.requestPlain
        }
    }
    
    public var validationType: ValidationType {
        return .successCodes
    }
    
    public var headers: [String : String]? {
        return nil
    }
    
    var foodResponse: String {
        return """
[{
    "id": 1,
    "title": "Pizza HotDog",
    "price": "4.0",
    "details": "Amazing american hot dog with sauces",
    "gredients": "any data",
    "image": "https://www.budgetbytes.com/wp-content/uploads/2010/07/Classic-Homemade-Pizza-Dough-close-V3.jpg",
    "type": "PIZZA"
}, {
    "id": 2,
    "title": "Margerita pizza",
    "price": "3.0",
    "details": "vegitables with onions slices pizza",
    "gredients": "any data",
    "image": "https://www.vegrecipesofindia.com/wp-content/uploads/2020/11/pizza-recipe.jpg",
    "type": "PIZZA"
}, {
    "id": 3,
    "title": "Pizza mashroum",
    "price": "2.5",
    "details": "mashroom pizza with amazing red spicy sauces",
    "weight": "any data",
    "image": "https://thebigmansworld.com/wp-content/uploads/2020/03/2-ingredient-pizza-dough-11.jpg",
    "type": "PIZZA"
}, {
    "id": 4,
    "title": "Sushi one",
    "price": "3.5",
    "details": "best asian sushi",
    "gredients": "any data",
    "image": "https://1k9ch93e3xh2t4pa12vvmx1t-wpengine.netdna-ssl.com/wp-content/uploads/2017/09/Vegan-sushi-donuts_4516b.jpg",
    "type": "SUSHI"
}, {
    "id": 5,
    "title": "Sushi two",
    "price": "5.5",
    "details": "best asian sushi",
    "gredients": "any data",
    "image": "https://ichef.bbci.co.uk/news/976/cpsprodpb/A688/production/_117623624_tv049068398.jpg",
    "type": "SUSHI"
}, {
    "id": 6,
    "title": "Sushi three",
    "price": "5.0",
    "details": "best asian sushi",
    "gredients": "any data",
    "image": "https://cdn.kiwilimon.com/recetaimagen/36725/th5-640x426-45808.jpg",
    "type": "SUSHI"
}, {
    "id": 7,
    "title": "hot chocklete",
    "price": "3.6",
    "details": "Amazing coffe",
    "gredients": "any data",
    "image": "http://cairopulse.net/wp-content/uploads/2021/02/51523810_1672957306184148_5994480460548276224_o-1.jpg",
    "type": "DRINKS"
}, {
    "id": 8,
    "title": "Coffee mix",
    "price": "3.0",
    "details": "amaizng coffee",
    "gredients": "any data",
    "image": "http://cairopulse.net/wp-content/uploads/2021/02/52673017_2493184000697356_8249807335736737792_o-1.jpg",
    "type": "DRINKS"
}, {
    "id": 9,
    "title": "Nescafe",
    "price": "4.5",
    "details": "amazing coffee",
    "gredients": "any data",
    "image": "https://hostthetoast.com/wp-content/uploads/2019/12/Slow-Cooker-Hot-Chocolate-1.jpg",
    "type": "DRINKS"
}]
"""
    }
    var discountsResponse: String {
        return """
[{"id":1,"image":"https://image.freepik.com/free-vector/sale-special-offer-banner-sunburst-50-off-discount_1588-739.jpg"},{"id":2,"image":"https://image.freepik.com/free-vector/colorful-gradient-sale-background_23-2148829907.jpg"},{"id":3,"image":"https://image.freepik.com/free-vector/realistic-sale-background-with-ripped-paper_23-2148860761.jpg"}]
"""
    }
}
