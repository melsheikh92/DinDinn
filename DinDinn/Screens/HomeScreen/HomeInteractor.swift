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
    func loadDiscounts() {
        SlidersOffersUsecase().getSlidersOffers { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let discounts):
                self.presenter?.didReceiveDiscounts(discounts: discounts)
            case .failure(let error):
                self.presenter?.handleError(error: error)
            }
        }
    }
    
    func loadDishes() {
        AllDishesUseCase().getAllDishes(completion: { [weak self] result in
            guard let self = self else { return }
            switch result {
            case .success(let dishes):
                self.presenter?.didReceiveDishes(dishes: dishes)
            case .failure(let error):
                self.presenter?.handleError(error: error)
            }
        })
    }
    
}
