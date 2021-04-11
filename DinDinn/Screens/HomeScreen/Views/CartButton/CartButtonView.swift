//
//  CartButtonView.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 11/04/2021.
//

import UIKit
import DinDinnCore
import DinDinnResources

class CartButtonView: UIView {
    // MARK: Outlet
    
    
    
    // MARK: init
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit() {
        fromNib()
    }
}

