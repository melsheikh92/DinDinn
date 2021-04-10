//
//  Language.swift
//  DinDinnResources
//
//  Created by Mahmoud Elsheikh on 09/04/2021.
//

import Foundation


enum Language: String {
   case en = "en"
}

class LanguageManager {
 
    static let shared = LanguageManager()
    
    private init(){ /* single instance class */}
    
    var currentLanguage: Language {
        return .en
    }
    
}
