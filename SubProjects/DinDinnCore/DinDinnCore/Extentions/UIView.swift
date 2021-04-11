//
//  Views.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 09/04/2021.
//

import UIKit

extension UIView {
    @discardableResult
    public func fromNib() -> Self {
        return Bundle(for: Self.self)
            .loadNibNamed(String(describing: Self.self),
                          owner: nil, options: nil)![0] as! Self
    }
}
