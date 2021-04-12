//
//  TabCell.swift
//  DinDinn
//
//  Created by Mahmoud Elsheikh on 11/04/2021.
//

import UIKit
import DinDinnResources

class TabCell: UICollectionViewCell {
    static  let identifier = "TabCell"
    private let titleLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupViews()
    }
    
    var title: String? {
        didSet {
            titleLabel.text = title
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(frame: .zero)
    }
    
    func setupViews() {
        addSubview(titleLabel)
        
        titleLabel.textAlignment = .center
        titleLabel.textColor = .primaryText
        titleLabel.font = .boldSystemFont(ofSize: 24)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.topAnchor.constraint(equalTo: topAnchor, constant: 0).isActive = true
        titleLabel.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0).isActive = true
        titleLabel.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0).isActive = true
        titleLabel.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0).isActive = true
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
        titleLabel.text = ""
        titleLabel.font = .boldSystemFont(ofSize: 24)
        titleLabel.textColor = UIColor.primaryText
    }
    
    override var isSelected: Bool {
        didSet {
            UIView.animate(withDuration: 0.3) {
                self.titleLabel.textColor = self.isSelected ?
                    UIColor.primaryText : UIColor.primaryText.withAlphaComponent(0.6)
                self.titleLabel.font =  self.isSelected ?  .boldSystemFont(ofSize: 24) :  .boldSystemFont(ofSize: 24)
                self.layoutIfNeeded()
            }
        }
    }
    
}
