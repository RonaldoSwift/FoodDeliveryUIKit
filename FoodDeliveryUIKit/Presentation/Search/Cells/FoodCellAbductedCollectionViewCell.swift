//
//  FoodCellAbductedCollectionViewCell.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 18/11/23.
//

import UIKit

@IBDesignable
class FoodCellAbductedCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var hamburguerImage: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var marcaLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    static var identificador : String = "FoodCellAbductedCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
