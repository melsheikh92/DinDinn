//
//  Views.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 09/04/2021.
//

import UIKit

extension UIView {
    public func maskCorners(_ radius: CGFloat = 3.0, corners: CACornerMask) {
        layer.cornerRadius = radius
        layer.maskedCorners = corners
    }
}
