//
//  FastFoodCollectionViewCell.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 9/11/23.
//

import UIKit

@IBDesignable
class FastFoodCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var fastImageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var caloriesLabel: UILabel!
    @IBOutlet weak var PriceLabel: UILabel!
    @IBOutlet weak var DiscountLabel: UILabel!
    
    static var identificador : String = "FastFoodCollectionViewCell"

    override func awakeFromNib() {
        
        super.awakeFromNib()
        // Initialization code
    }

}
