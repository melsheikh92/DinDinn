//
//  CartWireframe.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 10/04/2021.

import UIKit
import DinDinnCore

public final class CartWireframe: BaseWireframe {
    
    // MARK: - Private properties -
    
    private let storyboard = UIStoryboard(name: "CartViewController", bundle: nil)
    
    // MARK: - Module setup -
    
    public init(input: CartModuleInput = .init(),
                delegate: CartModuleDelegate? = nil) {
        let moduleViewController = CartViewController.create()
        super.init(viewController: moduleViewController)
        
        let interactor = CartInteractor()
        let presenter = CartPresenter(
            view: moduleViewController,
            interactor: interactor,
            wireframe: self,
            input: input
        )
        presenter.delegate = delegate
        moduleViewController.presenter = presenter
        interactor.presenter = presenter
    }    
}

extension CartWireframe: CartWireframeProtocol {
    
}
