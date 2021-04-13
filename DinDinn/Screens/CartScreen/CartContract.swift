//
//  CartContract.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 10/04/2021.

import UIKit
import DinDinnCore

/// The input data model for this module
public struct CartModuleInput {
    let cartItems: [FoodItemDto]
    public init(cartItems: [FoodItemDto]) {
        self.cartItems = cartItems
    }
}

/// What the module exposes for its delegate
public protocol CartModuleDelegate: class {}

/// What the Wireframe/Router is exposing
public protocol CartWireframeProtocol: WireframeProtocol {
    init(input: CartModuleInput, delegate: CartModuleDelegate?)
}

/// What the View is exposing
/// Presenter -> View
protocol CartViewProtocol: ViewProtocol {}

/// What the Presenter is exposing
/// View -> Presenter
protocol CartPresenterProtocol: PresenterProtocol {
    func viewDidLoad()
    var dishes: [FoodItemDto] { get }
}

/// What the Interactor is exposing
/// Presenter -> Interactor
protocol CartInteractorProtocol: InteractorProtocol {}

/// What the Interactor is outputing
/// Interactor -> Presenter
protocol CartInteractorOutputProtocol: class {}
