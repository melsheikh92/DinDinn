//
//  HUDHandler.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 10/04/2021.
//

import Foundation
import MBProgressHUD

public protocol Loader {
    static func showLoader()
    static func hideLoader()
}

public final class DinDinnLoader: Loader {
    private static var loadingShown = false
    
    static let hud: MBProgressHUD = {
        let hud = MBProgressHUD()
        hud.mode = .determinateHorizontalBar
        return hud
    }()
    
    public static func showLoader() {
        loadingShown = true
        hud.show(animated: true)
    }
    
    public static func hideLoader() {
        loadingShown = false
        hud.hide(animated: true)
    }
    
}
