//
//  FilterView.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo on 25/10/23.
//

import UIKit

@IBDesignable
class FilterView: UIView {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var nameView: UILabel!
    
    
    @IBInspectable
    var image: UIImage? {
        didSet {
            imageView.image = image
        }
    }
    
    @IBInspectable
    var name: String? {
        didSet{
            nameView.text = name
        }
    }
    
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder: NSCoder){
        super.init(coder:coder)
        initSubviews()
    }
    
    func initSubviews(){
        let nib = UINib(nibName: String(describing: FilterView.self), bundle: nil)
        guard let view = nib.instantiate(withOwner: self,options: nil).first as? UIView
        else{
            fatalError("Error")
        }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
