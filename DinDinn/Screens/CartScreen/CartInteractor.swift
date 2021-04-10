//
//  CartInteractor.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 10/04/2021.

import Foundation
import DinDinnCore

final class CartInteractor {

    // MARK: - Private properties -

    // MARK: - Public properties -

    weak var presenter: CartInteractorOutputProtocol?
}

// MARK: - Extensions -

extension CartInteractor: CartInteractorProtocol {
}
