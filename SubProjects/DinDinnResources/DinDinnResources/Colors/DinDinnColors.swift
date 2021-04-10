//
//  DinDinnColors.swift
//  DinDinnResources
//
//  Created by Mahmoud Elsheikh on 09/04/2021.
//

import UIKit

enum DinDinnColors: String {
    case primaryText            = "primaryText"
    case secondaryText          = "secondaryText"
    case primaryBackground      = "primaryBackground"
    case cardBackground         = "cardBackground"
    case secondaryBackground    = "secondaryBackground"
    case accentColor            = "accentColor"
    case captionColor           = "captionColor"
    case errorColor             = "errorColor"
    case successColor           = "successColor"
}

extension DinDinnColors {
    var uiColor: UIColor {
        UIColor(
            named: self.rawValue,
            in: Bundle(for: LanguageManager.self),
            compatibleWith: .init()
        )!
    }
}

extension UIColor {
    public static let primaryText           = DinDinnColors.primaryText.uiColor
    public static let secondaryText         = DinDinnColors.secondaryText.uiColor
    public static let primaryBackground     = DinDinnColors.primaryBackground.uiColor
    public static let cardBackground        = DinDinnColors.cardBackground.uiColor
    public static let secondaryBackground   = DinDinnColors.secondaryBackground.uiColor
    public static let captionColor          = DinDinnColors.captionColor.uiColor
    public static let accentColor           = DinDinnColors.accentColor.uiColor
    public static let errorColor            = DinDinnColors.errorColor.uiColor
    public static let successColor          = DinDinnColors.successColor.uiColor
}
