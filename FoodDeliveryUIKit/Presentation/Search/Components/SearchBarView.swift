//
//  SearchBarView.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 18/11/23.
//

import UIKit

class SearchBarView: UIView {

    @IBOutlet weak var MagnifyingGlassImage: UIImageView!
    @IBOutlet weak var nombreTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }
    

    func initSubviews(){
        let nib = UINib(nibName: String(describing: SearchBarView.self), bundle: nil)
        guard let view = nib.instantiate(withOwner: self,options: nil).first as? UIView
        else{
            fatalError("Error")
        }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
