//
//  CategoryCollectionViewCell.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo on 25/10/23.
//

import UIKit

class CategoryCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var descriptionLabel: UILabel!
    
    static var identificador : String = "CategoryCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
    }
}
