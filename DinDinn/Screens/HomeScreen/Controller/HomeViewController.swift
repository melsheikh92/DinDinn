//
//  HomeViewController.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 10/04/2021.

import UIKit
import DinDinnCore
import DinDinnResources
import RxSwift
import RxCocoa

final class HomeViewController: UIViewController {
    
    // MARK: - Private properties -
    internal var presenter: HomePresenterProtocol!
    private let disposeBag = DisposeBag()
    // MARK: - Public properties -
    var dishes: [FoodItemDto]       = []
    var sections: [FoodCategoryDto] = []
    var currentSection: FoodCategoryDto = .pizza
    var previousSection: FoodCategoryDto?
    
    var cart = BehaviorRelay<[FoodItemDto]>(value: [])
    
    // MARK: - Outlets
    @IBOutlet weak var cartLabelBackgroundImage: UIImageView!
    @IBOutlet weak var cartIconBackground: UIImageView!
    @IBOutlet weak var menuTableView: UITableView! {
        didSet {
            menuTableView.register(DishItemCell.nib, forCellReuseIdentifier: DishItemCell.identifier)
            menuTableView.separatorStyle = .none
            menuTableView.allowsMultipleSelection = false
            menuTableView.allowsSelection = false
            menuTableView.tableFooterView = UIView()
            menuTableView.delegate = self
            menuTableView.dataSource = self
        }
    }
    @IBOutlet weak var tabsView: TabsView!
    @IBOutlet weak var menuView: UIView!
    @IBOutlet weak var sliderView: SliderView!
    @IBOutlet weak var menuTopConstraint: NSLayoutConstraint!
    @IBOutlet weak var sliderHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var cartButtonView: UIView!
    @IBOutlet weak var cartImageView: UIImageView!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var cartButton: UIButton!
    
    // MARK: - Lifecycle -
    
    override func viewDidLoad() {
        super.viewDidLoad()
        presenter.viewDidLoad()
        // corners at top of menu
        menuView.maskCorners(25, corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        menuView.layer.cornerRadius  = 25
        menuView.layer.masksToBounds = true
        
        tabsView.maskCorners(25, corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner])
        tabsView.layer.cornerRadius  = 25
        tabsView.layer.masksToBounds = true
        tabsView.backgroundColor = .white
        menuTableView.backgroundColor = .white
        
        menuView.addShadow(offsetX: 0, offsetY: 2)
         // setup cart button images label and views
        cartButtonView.backgroundColor = .clear
        cartImageView.image = DinDinnImages.cart.image
        countLabel.textColor = .secondaryText
        countLabel.font = .systemFont(ofSize: 8)
        cartIconBackground.image = DinDinnImages.circle.image
        cartLabelBackgroundImage.image = DinDinnImages.circle.image
        cartIconBackground.contentMode = .scaleAspectFill
        cartLabelBackgroundImage.contentMode = .scaleAspectFill
        cartIconBackground.tintColor = .accentColor
        
        cartLabelBackgroundImage.tintColor = .primaryBackground
        
        /// setup tabs
        self.sections = FoodCategoryDto.casesArray()
        tabsView.items = sections.map({ $0.rawValue.capitalized })
        tabsView.didSelectTab = { value in
            self.previousSection = self.currentSection
            self.currentSection = self.sections[value]
            self.rerenderTableView()
        }
        menuTableView.rx.contentOffset.throttle(0.05, scheduler: MainScheduler.instance).subscribe {
            print("offset now \($0.element)")
            self.updateViewForContentOfsetChanges()
        }.disposed(by: disposeBag)
        
        /// swipe gestures
        let swipeRight = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeRight.direction = .right
        self.view.addGestureRecognizer(swipeRight)
        
        let swipeleft = UISwipeGestureRecognizer(target: self, action: #selector(respondToSwipeGesture))
        swipeleft.direction = .left
        
        self.view.addGestureRecognizer(swipeleft)
        
        /// cart listners
        cart.subscribe { (event) in
            self.serupCartButton(with: event.element ?? [])
        }.disposed(by: disposeBag)
        cartButton.rx.controlEvent(UIControl.Event.touchDown).subscribe { [weak self] (_) in
            self?.goToCheckout()
        }.disposed(by: disposeBag)
        
    }
    func goToCheckout() {
        self.presenter.gotToCheckout(with: cart.value)
    }
    func serupCartButton(with value: [FoodItemDto] ){
        if value.isEmpty {
            cartButton.isEnabled = false
            countLabel.text = "0"
        } else {
            cartButton.isEnabled = true
            countLabel.text = "\(value.count)"
        }
    }
    func goToNextPage() {
        guard let idx = sections.firstIndex(where: { $0 == currentSection}), idx + 1 < sections.count else {
            return
        }
        previousSection = currentSection
        currentSection = sections[idx  + 1]
        tabsView.selectedIndex = idx + 1
        rerenderTableView()
    }
    
    func goToPreviousPage() {
        guard let idx = sections.firstIndex(where: { $0 == currentSection}), idx - 1 >= 0 else {
            return
        }
        previousSection = currentSection
        currentSection = sections[idx - 1]
        tabsView.selectedIndex = idx - 1
        rerenderTableView()
    }
    
    @objc func respondToSwipeGesture(gesture: UIGestureRecognizer) {
        if let swipeGesture = gesture as? UISwipeGestureRecognizer {
            switch swipeGesture.direction {
            case .right:
                goToPreviousPage()
            case .left:
                goToNextPage()
            default:
                return
            }
        }
    }
    
    func updateViewForContentOfsetChanges() {
        let value = menuTableView.contentOffset.y
        
        if ((sliderHeightConstraint.constant > 30 && value > 0) || ( sliderHeightConstraint.constant >= 30 && value < 0 && sliderHeightConstraint.constant < 440)) {
            sliderHeightConstraint.constant = (sliderHeightConstraint.constant - value) < 30 ? 30 : sliderHeightConstraint.constant - value
            menuTopConstraint.constant = (menuTopConstraint.constant - value) < 30 ? 30 : menuTopConstraint.constant - value
        }
    }
    
    func rerenderTableView() {
        menuTableView.beginUpdates()
        if let prevSection = self.previousSection {
            let prevItems = dishes.filter({ $0.getCategory() == prevSection })
            var prevIndexPaths: [IndexPath] = []
            for(index, _) in prevItems.enumerated() {
                prevIndexPaths.append(IndexPath(row: index, section: 0))
            }
            menuTableView.deleteRows(at: prevIndexPaths, with: .right)
        }
        let newItems = dishes.filter({ $0.getCategory() == currentSection })
        var newIndexPaths: [IndexPath] = []
        for(index, _) in newItems.enumerated() {
            newIndexPaths.append(IndexPath(row: index, section: 0))
        }
        menuTableView.insertRows(at: newIndexPaths, with: .right)
        menuTableView.endUpdates()
    }
}

// MARK: - Extensions -

extension HomeViewController: HomeViewProtocol {
    func handleError(error: Error) {
        // TODO
    }
    
    func didReceiveDishes(dishes: [FoodItemDto]) {
        self.dishes   = dishes
        self.rerenderTableView()
    }
    func didReceiveDiscounts(discounts: [DicountDto]) {
        self.sliderView.setItems(discounts: discounts) 
    }
}

extension HomeViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dishes.filter({ $0.getCategory() == currentSection }).count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(
                withIdentifier: DishItemCell.identifier,
                for: indexPath) as? DishItemCell
        else {
            return UITableViewCell()
        }
        let dish = dishes.filter({ $0.getCategory() == currentSection })[indexPath.row]
        cell.item = dish
        cell.viewHolder.backgroundColor = .primaryBackground
        
        cell.buyButton.rx.controlEvent([.touchDown]).subscribe { (event) in
            var newCurrentCart = self.cart.value
            newCurrentCart.append(dish)
            self.cart.accept(newCurrentCart)
        }.disposed(by: self.disposeBag)
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 350
    }
}
