//
//  TabsSuperior.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 8/11/23.
//

import UIKit

@IBDesignable
class TabSuperiorView: UIView {
    
    @IBOutlet weak var optionImageView: UIImageView!
    @IBOutlet weak var searchImageView: UIImageView!
    @IBOutlet weak var bagImageView: UIImageView!
    
    //Prpiedasd que se añaden en el option
   /* @IBInspectable
    var optionImage: UIImage? {
        didSet{
            optionImageView?.image = optionImage
        }
    }
    
    @IBInspectable
    var searchImage: UIImage? {
        didSet{
            optionImageView?.image = searchImage
        }
    }
    
    @IBInspectable
    var bagImage: UIImage? {
        didSet{
            optionImageView?.image = bagImage
        }
    }*/
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        initSubviews()
    }
    
    
    func initSubviews(){
        let nib = UINib(nibName: String(describing: TabSuperiorView.self), bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        else{
            fatalError("Error")
        }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
