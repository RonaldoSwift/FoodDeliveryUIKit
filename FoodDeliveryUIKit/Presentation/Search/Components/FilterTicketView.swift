//
//  FilterTicketView.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 18/11/23.
//

import UIKit

@IBDesignable
class FilterTicketView: UIView {
    
    @IBOutlet weak var checkListImage: UIImageView!
    @IBOutlet weak var nameLabel: UILabel!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubview()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubview()
    }
    
    func initSubview(){
        let nib = UINib(nibName: String(describing: FilterTicketView.self), bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        else{
            fatalError("Error")
        }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
