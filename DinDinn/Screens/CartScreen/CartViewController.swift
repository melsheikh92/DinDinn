//
//  CartViewController.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 10/04/2021.

import UIKit
import DinDinnCore

final class CartViewController: UIViewController {

    // MARK: - Private properties -

    internal var presenter: CartPresenterProtocol!

    // MARK: - Public properties -

    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
    }

}

// MARK: - Extensions -

extension CartViewController: CartViewProtocol {
}
