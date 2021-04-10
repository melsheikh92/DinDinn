//
//  HomeInteractor.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 10/04/2021.

import Foundation
import DinDinnCore

final class HomeInteractor {

    // MARK: - Private properties -

    // MARK: - Public properties -

    weak var presenter: HomeInteractorOutputProtocol?
}

// MARK: - Extensions -

extension HomeInteractor: HomeInteractorProtocol {
}
