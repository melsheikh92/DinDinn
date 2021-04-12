//
//  String.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 12/04/2021.
//

import Foundation

extension String {
    func capitalizingFirstLetter() -> String {
        return prefix(1).capitalized + dropFirst()
    }
    
    public var capitalized: String {
       return self.lowercased().capitalizingFirstLetter()
    }
}
