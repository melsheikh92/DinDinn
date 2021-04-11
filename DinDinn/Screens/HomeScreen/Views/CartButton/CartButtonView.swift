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
    
    @IBOutlet weak var contentView: UIView!
    
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
        Bundle.main.loadNibNamed(String(describing: SliderView.self), owner: self, options: nil)
        addSubview(contentView)
        contentView.frame = self.bounds
        contentView.autoresizingMask = [.flexibleWidth, .flexibleHeight]
    }
}

