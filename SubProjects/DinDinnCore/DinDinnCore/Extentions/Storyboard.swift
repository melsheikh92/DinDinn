//
//  Storyboard.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 09/04/2021.
//

import UIKit

extension UIStoryboard {
    func instantiateViewController<T>(with identifier: String? = nil) -> T where T: StoryboardInstantiable {
        let storyboardID = identifier ?? T.storyboardIdentifier
        guard let viewController = instantiateViewController(withIdentifier: storyboardID) as? T else {
            fatalError("Couldn't instantiate view controller with identifier \(storyboardID)")
        }
        return viewController
    }
}

public protocol StoryboardInstantiable {
    static var storyboardIdentifier: String { get }
}

extension StoryboardInstantiable where Self: UIViewController {
    public static var storyboardIdentifier: String {
        return String(describing: self)
    }
    
    public static func create(with identifier: String? = nil, bundle: Bundle? = nil) -> Self {
        let storyboardID = identifier ?? storyboardIdentifier
        let storyboard = UIStoryboard(name: storyboardID, bundle: bundle)
        return storyboard.instantiateViewController(with: identifier)
    }
    
}

 extension UIViewController: StoryboardInstantiable {}
