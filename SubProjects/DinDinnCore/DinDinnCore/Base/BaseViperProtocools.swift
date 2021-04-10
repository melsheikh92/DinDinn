//
//  ViperBaseProtocools.swift
//  DinDinnCore
//
//  Created by Mahmoud Elsheikh on 10/04/2021.
//

import UIKit

public protocol WireframeProtocol: class {
    var viewController: UIViewController { get }
    var navigationController: UINavigationController? { get }
    var parentWireframe: WireframeProtocol? { get set }
    
    func pushChildWireframe(
        _ childWireframe: WireframeProtocol,
        animated: Bool
    )
    
    func presentChildWireframe(
        _ childWireframe: WireframeProtocol,
        animated: Bool,
        completion: (() -> Void)?
    )
    func closeWireframe(animated: Bool, completion: (() -> Void)?)
}

public protocol ViewProtocol: class {}
public protocol PresenterProtocol: class {}
public protocol InteractorProtocol: class {}
