//
//  FoodCellTableViewCell.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 27/11/23.
//

import UIKit

@IBDesignable
class FoodCellTableViewCell: UITableViewCell {
    
    @IBOutlet weak var marcaImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    static var identificador : String = "FoodCellTableViewCell"
    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
