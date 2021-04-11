//
//  HomeViewController.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 10/04/2021.

import UIKit
import DinDinnCore
import DindinnResources

final class HomeViewController: UIViewController {

    // MARK: - Private properties -

    internal var presenter: HomePresenterProtocol!

    // MARK: - Public properties -

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        view.bachgroundColor = .primaryBackground
    }

}

// MARK: - Extensions -

extension HomeViewController: HomeViewProtocol {
}
