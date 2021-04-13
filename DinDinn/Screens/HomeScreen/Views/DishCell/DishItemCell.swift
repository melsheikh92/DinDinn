//
//  DishItemCell.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 12/04/2021.
//

import UIKit
import DinDinnCore
import DinDinnResources

class DishItemCell: UITableViewCell {

    static let identifier = "DishItemCell"
    static let nib = UINib(nibName: identifier, bundle: .main)
  
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewHolder: UIView!
    @IBOutlet weak var imageHolder: UIImageView!
    @IBOutlet weak var buyButton: UIButton!
    @IBOutlet weak var detailsLabel: UILabel!
    
    var addToCart: ((FoodItemDto)-> Void)?
    var item: FoodItemDto? {
        didSet {
            fillData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewHolder.backgroundColor = .cardBackground
        viewHolder.maskCorners(15, corners: [.layerMinXMinYCorner, .layerMaxXMinYCorner, .layerMinXMaxYCorner, .layerMaxXMaxYCorner])
        viewHolder.layer.cornerRadius  = 15
        viewHolder.layer.masksToBounds = true
        viewHolder.backgroundColor = .primaryBackground
        
    }
    @IBAction func addToCardDidClicked(_ sender: Any) {
        guard let item = item else {
            return
        }
        addToCart?(item)
        buyButton.backgroundColor = .captionColor
    }
    
    func fillData() {
        guard let item = item else {
            return
        }
        imageHolder.loadFrom(urlString: item.image)
        titleLabel.text = item.title
        detailsLabel.text = item.gredients ?? "no details"
        buyButton.setTitle( item.price + " USD", for: .normal)
    }

}
