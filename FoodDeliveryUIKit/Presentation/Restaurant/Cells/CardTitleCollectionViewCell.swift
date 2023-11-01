//
//  CardTitleCollectionViewCell.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 31/10/23.
//

import UIKit

class CardTitleCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var logoMacdonaldsImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var locationImage: UIImageView!
    @IBOutlet weak var heartImage: UIImageView!
    
    static var identificador: String = "CardTitleCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
