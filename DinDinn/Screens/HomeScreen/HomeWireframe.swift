//
//  HomeWireframe.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 10/04/2021.

import UIKit
import DinDinnCore

public final class HomeWireframe: BaseWireframe {

    // MARK: - Private properties -

    private let storyboard = UIStoryboard(name: "HomeViewController", bundle: nil)

    // MARK: - Module setup -

    public init(input: HomeModuleInput = .init(),
                delegate: HomeModuleDelegate? = nil) {
        let moduleViewController = HomeViewController.create()
        super.init(viewController: moduleViewController)
        
        let interactor = HomeInteractor()
        let presenter = HomePresenter(
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

// MARK: - Extensions -

extension HomeWireframe: HomeWireframeProtocol {
}
