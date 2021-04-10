//
//  BaseWireframe.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 10/04/2021.
//

import UIKit

open class BaseWireframe: WireframeProtocol {
    private unowned var _viewController: UIViewController
    
    public var parentWireframe: WireframeProtocol? = nil
    
    public init(viewController: UIViewController) {
        _viewController = viewController
    }
    
    public var viewController: UIViewController {
        return _viewController
    }
    
    public var navigationController: UINavigationController? {
        return _viewController.navigationController
    }
    
    public func pushChildWireframe(_ childWireframe: WireframeProtocol, animated: Bool) {
        childWireframe.parentWireframe = self
        let nextViewController = childWireframe.viewController
        nextViewController.hidesBottomBarWhenPushed = true
        self.navigationController?.pushViewController(nextViewController, animated: animated)
    }
    
    public func presentChildWireframe(_ childWireframe: WireframeProtocol, animated: Bool, completion: (() -> Void)?) {
        childWireframe.parentWireframe = self
        self.viewController.present(
            childWireframe.viewController,
            animated: animated,
            completion: completion
        )
    }
    
    public func closeWireframe(animated: Bool, completion: (() -> Void)?) {
        let isAbstractWireframe: Bool = {
            if let parentWireframe = self.parentWireframe,
               parentWireframe.viewController == self.viewController {
                return true
            }
            return false
        }()
        if viewController.isPresented && !isAbstractWireframe {
            if let navigationController = self.navigationController {
                navigationController.dismiss(animated: animated, completion: completion)
            } else {
                viewController.dismiss(animated: animated, completion: completion)
            }
        } else if
            let navigationController = self.navigationController,
            let parentWireframe = self.parentWireframe
        {
            navigationController.popToViewController(parentWireframe.viewController, animated: animated)
            completion?()
        } else {
            assertionFailure("Wireframe pushed or presented without a parent wireframe.")
            self.navigationController?.popViewController(animated: true)
        }
    }
}
