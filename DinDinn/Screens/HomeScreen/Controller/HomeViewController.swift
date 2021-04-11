//
//  HomeViewController.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 10/04/2021.

import UIKit
import DinDinnCore
import DinDinnResources

final class HomeViewController: UIViewController {

    // MARK: - Private properties -

    internal var presenter: HomePresenterProtocol!

    // MARK: - Public properties -

  
    
    @IBOutlet weak var sliderView: SliderView!
    
    
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        
        presenter.viewDidLoad()
        view.backgroundColor = .primaryBackground
    }

}

// MARK: - Extensions -

extension HomeViewController: HomeViewProtocol {
}
