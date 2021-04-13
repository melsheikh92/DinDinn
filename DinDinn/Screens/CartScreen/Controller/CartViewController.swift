//
//  CartViewController.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 10/04/2021.

import UIKit
import DinDinnCore
import DinDinnResources
import RxSwift
import RxCocoa

final class CartViewController: UIViewController {
    
    // MARK: - Private properties -
    let disposeBag = DisposeBag()
    internal var presenter: CartPresenterProtocol!
    var dishes: [FoodItemDto] = [] {
        didSet {
            if !dishes.isEmpty {
                tableView.reloadData()
            }
        }
    }
    
    // MARK: - Public properties -
    @IBOutlet weak var backImageView: UIImageView!
    @IBOutlet weak var menuLabel: UILabel!
    @IBOutlet weak var backButton: UIButton!
    @IBOutlet weak var tabsView: TabsView!
    @IBOutlet weak var tableView: UITableView! {
        didSet{
            tableView.register(DishItemCell.nib, forCellReuseIdentifier: DishItemCell.identifier)
            tableView.separatorStyle = .none
            tableView.allowsMultipleSelection = false
            tableView.allowsSelection = false
            tableView.delegate = self
            tableView.dataSource = self
        }
    }
    // MARK: - Lifecycle -

    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        menuLabel.text = AppStrings.menu
        menuLabel.font = .systemFont(ofSize: 20)
        menuLabel.textColor = .primaryText
        backImageView.image = DinDinnImages.back.image
        backImageView.contentMode = .scaleAspectFit
        tabsView.items = [AppStrings.cart, AppStrings.order, AppStrings.invoices]
        
        dishes = presenter.dishes
        
        backButton.rx.controlEvent([.touchDown]).subscribe { [weak self] (_) in
            self?.dismiss(animated: true, completion: nil)
        }.disposed(by: disposeBag)
    }

}

// MARK: - Extensions -

extension CartViewController: CartViewProtocol {
}

extension CartViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DishItemCell.identifier,
                for: indexPath) as? DishItemCell
        else {
            return UITableViewCell()
        }
        let dish = dishes[indexPath.row]
        cell.item = dish
        cell.viewHolder.backgroundColor = .primaryBackground
        
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
    
}
