//
//  HomeContract.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 10/04/2021.

import UIKit
import DinDinnCore

/// The input data model for this module
public struct HomeModuleInput {
    public init() {}
}

/// What the module exposes for its delegate
public protocol HomeModuleDelegate: class {}

/// What the Wireframe/Router is exposing
public protocol HomeWireframeProtocol: WireframeProtocol {
    init(input: HomeModuleInput, delegate: HomeModuleDelegate?)
}

/// What the View is exposing
/// Presenter -> View
protocol HomeViewProtocol: ViewProtocol {
    func didReceiveDishes(dishes: [FoodItemDto])
    func didReceiveDiscounts(discounts: [DicountDto])
    func handleError(error: Error)
}

/// What the Presenter is exposing
/// View -> Presenter
protocol HomePresenterProtocol: PresenterProtocol {
    func viewDidLoad()
    func gotToCheckout(with: [FoodItemDto])
}

/// What the Interactor is exposing
/// Presenter -> Interactor
protocol HomeInteractorProtocol: InteractorProtocol {
    func loadDiscounts()
    func loadDishes()
}

/// What the Interactor is outputing
/// Interactor -> Presenter
protocol HomeInteractorOutputProtocol: class {
    func didReceiveDishes(dishes: [FoodItemDto])
    func didReceiveDiscounts(discounts: [DicountDto])
    func handleError(error: Error)
}
