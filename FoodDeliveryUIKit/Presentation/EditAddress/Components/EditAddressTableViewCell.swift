//
//  EditAddressTableViewCell.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 5/12/23.
//

import UIKit

class EditAddressTableViewCell: UITableViewCell {
    
    @IBOutlet weak var homeImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    static var identificador : String = "EditAddressTableViewCell"

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
