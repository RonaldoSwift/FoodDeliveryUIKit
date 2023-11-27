//
//  AllCategoriesCollectionViewCell.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 18/11/23.
//

import UIKit

class AllCategoriesCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var AllCategorieBurguerImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static var identificador : String = "AllCategoriesCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
