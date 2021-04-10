//
//  CartPresenter.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 10/04/2021.

import Foundation
import DinDinnCore

final class CartPresenter {

    // MARK: - Private properties -

    private unowned let view: CartViewProtocol
    private let interactor: CartInteractorProtocol
    private let wireframe: CartWireframeProtocol
    private let input: CartModuleInput

    // MARK: - Public properties -
    
    public weak var delegate: CartModuleDelegate?

    // MARK: - Lifecycle -

    init(view: CartViewProtocol,
         interactor: CartInteractorProtocol,
         wireframe: CartWireframeProtocol,
         input: CartModuleInput) {
        self.view = view
        self.interactor = interactor
        self.wireframe = wireframe
        self.input = input
    }
}

// MARK: - Presenter Protocol -

extension CartPresenter: CartPresenterProtocol {
    func viewDidLoad() {}
}

// MARK: - Interactor Output -

extension CartPresenter: CartInteractorOutputProtocol {
}
