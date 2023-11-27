//
//  BurguersCollectionViewCell.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 18/11/23.
//

import UIKit

class BurguersCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var burguerImage: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var marcaLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    static var identificador : String = "BurguersCollectionViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
}
