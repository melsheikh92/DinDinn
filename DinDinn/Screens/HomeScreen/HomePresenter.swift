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
    func viewDidLoad() {}
}

// MARK: - Interactor Output -

extension HomePresenter: HomeInteractorOutputProtocol {
}
