//
//  HUDHandler.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 10/04/2021.
//

import ProgressHUD

public protocol Loader {
    static func showLoader()
    static func hideLoader()
}

public final class DinDinnLoader: Loader {
    private static var loadingShown = false
    
   
    public static func showLoader() {
        loadingShown = true
        ProgressHUD.animationType = .circleStrokeSpin
        ProgressHUD.show()
    }
    
    public static func hideLoader() {
        loadingShown = false
        ProgressHUD.dismiss()
    }
    
}
