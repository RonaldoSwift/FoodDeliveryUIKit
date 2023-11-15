//
//  ScorecardView.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 9/11/23.
//

import UIKit

@IBDesignable
class ScorecardView: UIView {
    
    @IBOutlet weak var starImageView: UIImageView!
    @IBOutlet weak var deliveriImageView: UIImageView!
    @IBOutlet weak var sleccionImageView: UIImageView!
    @IBOutlet weak var ratingLabel: UILabel!
    @IBOutlet weak var deliveriLabel: UILabel!
    @IBOutlet weak var burguerLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initSubviews()
    }
    required init?(coder: NSCoder){
        super.init(coder: coder)
        initSubviews()
    }
    
    func initSubviews(){
        let nib = UINib(nibName: String(describing: ScorecardView.self), bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        else{
            fatalError("Error")
        }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
