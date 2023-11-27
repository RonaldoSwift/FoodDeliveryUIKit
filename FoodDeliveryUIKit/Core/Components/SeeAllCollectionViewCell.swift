//
//  SeeAllCollectionViewCell.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 10/11/23.
//

import UIKit

class SeeAllCollectionViewCell: UICollectionViewCell {
    
    
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static var identificador = "SeeAllCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        
        descriptionLabel.layer.borderWidth = 2
        descriptionLabel.layer.borderColor = UIColor.systemBlue.cgColor
        let radius: CGFloat = descriptionLabel.bounds.size.width / 2
        descriptionLabel.layer.cornerRadius = radius
    }
}
