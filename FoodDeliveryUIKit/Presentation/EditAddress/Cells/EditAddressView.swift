//
//  EditAddressView.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 18/11/23.
//

import UIKit

class EditAddressView: UIView {
    
    @IBOutlet weak var editAddressButton: UIButton!
    @IBOutlet weak var nombreSearchTextField: UITextField!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }
    
    func initSubviews(){
        let nib = UINib(nibName: String(describing: EditAddressView.self), bundle: nil)
        guard let view = nib.instantiate(withOwner: self,options: nil).first as? UIView
        else{
            fatalError("Error")
        }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
