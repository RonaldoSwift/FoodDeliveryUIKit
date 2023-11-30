//
//  RestaurantBrandCollectionViewCell.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo on 27/10/23.
//

import UIKit

class RestaurantBrandCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var ProductoImage: UIImageView!
    @IBOutlet weak var marcaImage: UIImageView!
    @IBOutlet weak var nameRestaurantLabel: UILabel!
    @IBOutlet weak var distanciaLabel: UILabel!
    
    static var identificador = "RestaurantBrandCollectionViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
}
