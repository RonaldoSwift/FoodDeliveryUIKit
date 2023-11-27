//
//  FoodCellAbductedTableViewCell.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 24/11/23.
//

import UIKit

@IBDesignable
class FoodCellAbductedTableViewCell: UITableViewCell {
    
    @IBOutlet weak var hamburguerImage: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var logoImage: UIImageView!
    @IBOutlet weak var marcaLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    static var identificador : String = "FoodCellAbductedTableViewCell"
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
