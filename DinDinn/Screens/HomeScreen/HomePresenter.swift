//
//  HomePresenter.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 10/04/2021.

import Foundation
import DinDinnCore

final class HomePresenter {
    
    // MARK: - Private properties -
    
    private unowned let view: HomeViewProtocol
    private let interactor: HomeInteractorProtocol
    private let wireframe: HomeWireframeProtocol
    private let input: HomeModuleInput
    
    // MARK: - Public properties -
    
    public weak var delegate: HomeModuleDelegate?
    
    // MARK: - Lifecycle -
    
    init(view: HomeViewProtocol,
         interactor: HomeInteractorProtocol,
         wireframe: HomeWireframeProtocol,
         input: HomeModuleInput) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.input = input
    }
}

// MARK: - Presenter Protocol -

extension HomePresenter: HomePresenterProtocol {
    func viewDidLoad() {
        interactor.loadDishes()
        interactor.loadDiscounts()
    }
    
    func gotToCheckout(with value: [FoodItemDto]) {
        let cartWireFrame = CartWireframe(input: CartModuleInput(cartItems: value))
        cartWireFrame.viewController.modalPresentationStyle = .fullScreen
        wireframe.presentChildWireframe(cartWireFrame, animated: true, completion: nil)
    }
}

// MARK: - Interactor Output -

extension HomePresenter: HomeInteractorOutputProtocol {
    func didReceiveDishes(dishes: [FoodItemDto]) {
        view.didReceiveDishes(dishes: dishes)
    }
    
    func didReceiveDiscounts(discounts: [DicountDto]) {
        view.didReceiveDiscounts(discounts: discounts)
    }
    func handleError(error: Error){
        view.handleError(error: error)
    }
}
