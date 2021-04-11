//
//  DishTableViewCell.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 11/04/2021.
//

import UIKit

class DishTableViewCell: UITableViewCell {
    
    static let identifier = "DishTableViewCell"
    static let nib        = UINib(nibName: identifier, bundle: nil)

    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
}
