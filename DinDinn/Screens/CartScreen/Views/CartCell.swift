//
//  CartCell.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 13/04/2021.
//

import UIKit
import DinDinnResources
import DinDinnCore

class CartCell: UITableViewCell {
    static let identifier = "CartCell"
    static let nib = UINib(nibName: identifier, bundle: .main)
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var viewHolder: UIView!
    @IBOutlet weak var imageHolder: UIImageView!
    @IBOutlet weak var buyButton: UIButton!
    
    var removeFromCart: ((FoodItemDto)-> Void)?
    var item: FoodItemDto? {
        didSet {
            fillData()
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        viewHolder.backgroundColor = .cardBackground
        titleLabel.textColor = .primaryText
        imageHolder.contentMode = .scaleAspectFit
        buyButton.setImage(DinDinnImages.remove.image, for: .normal)

    }
    
    @IBAction func didClickRemove(_ sender: Any) {
        
    }
    
    func fillData() {
        guard let item = item else {
            return
        }
        titleLabel.text = item.title
        imageHolder.loadFrom(urlString: item.image)
    }
}
