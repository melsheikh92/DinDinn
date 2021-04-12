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
    public func addShadow(offsetX: CGFloat = 0, offsetY: CGFloat = 0,
                   color: UIColor = .black, opacity: Float = 0.3, radius: CGFloat = 5.0) {
        self.layer.masksToBounds = false
        self.layer.shadowColor = color.cgColor
        self.layer.shadowOffset = CGSize(width: offsetX, height: offsetY)
        self.layer.shadowOpacity = opacity
        self.layer.shadowRadius = radius
    }
}
