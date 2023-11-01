//
//  IconsCollectionViewCell.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 31/10/23.
//

import UIKit

class IconsCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var bagImage: UIImageView!
    @IBOutlet weak var listDashImage: UIImageView!
    @IBOutlet weak var magnifyImage: UIImageView!
    
    static var identificador: String = "IconsCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

}
