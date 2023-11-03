//
//  ListBurguersView.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 2/11/23.
//

import UIKit

class ListBurguersView: UIView {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
        initSubviews()
    }
    
    func initSubviews(){
        let nib = UINib(nibName: String(describing: ListBurguersView.self), bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Unable to convert nib")
        }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
