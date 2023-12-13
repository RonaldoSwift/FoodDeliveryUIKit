//
//  ModifierFooterTableViewCell.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 13/12/23.
//

import UIKit

class ModifierFooterTableViewCell: UITableViewCell {

    static let reuseIdentifier: String = String(describing: ModifierFooterTableViewCell.self)
    
    static var nib: UINib {
        return UINib(nibName: String(describing: self), bundle: nil)
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
