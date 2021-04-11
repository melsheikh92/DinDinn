//
//  TabCell.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 11/04/2021.
//

import UIKit
import DinDinnResources

class TabCell: UICollectionViewCell {
    static let identifier = "TabCell"
    let titleLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(titleLabel)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(frame: .zero)
    }
    
    func setupViews() {
        titleLabel.textAlignment = .center
        titleLabel.textColor = .primaryText
        titleLabel.font = .boldSystemFont(ofSize: 17)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        titleLabel.font = .boldSystemFont(ofSize: 17)
        titleLabel.textColor = UIColor.primaryText
    }
    
    override var isSelected: Bool {
        didSet {
            UIView.animate(withDuration: 0.3) {
                self.titleLabel.textColor = self.isSelected ?
                    UIColor.primaryText : UIColor.primaryText.withAlphaComponent(0.6)
                self.titleLabel.font =  self.isSelected ?  .boldSystemFont(ofSize: 17) :  .boldSystemFont(ofSize: 16)
                self.layoutIfNeeded()
            }
        }
    }
    
}
