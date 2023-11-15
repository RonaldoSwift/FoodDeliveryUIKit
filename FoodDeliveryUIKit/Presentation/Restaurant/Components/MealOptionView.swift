//
//  MealOptionView.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 9/11/23.
//

import UIKit

@IBDesignable
class MealOptionView: UIView {
    
    @IBOutlet weak var nombreLabel: UILabel!
    
    @IBInspectable
    var name: String? {
        didSet{
            nombreLabel.text = name
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }
    
    func initSubviews(){
        let nib = UINib(nibName: String(describing: MealOptionView.self), bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        else{
            fatalError("Error")
        }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
