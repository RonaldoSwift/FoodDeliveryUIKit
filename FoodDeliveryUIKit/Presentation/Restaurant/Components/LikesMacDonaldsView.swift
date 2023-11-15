//
//  LikesMacDonaldsView.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 8/11/23.
//

import UIKit

@IBDesignable
class LikesMacDonaldsView: UIView {

    @IBOutlet weak var logoEmpresaImageView: UIImageView!
    @IBOutlet weak var tituloLabel: UILabel!
    @IBOutlet weak var ubicacionImageView: UIImageView!
    @IBOutlet weak var referenciaLabel: UILabel!
    @IBOutlet weak var likeButton: UIButton!
    
    override init(frame: CGRect){
        super.init(frame: frame)
        initSubviews()
    }
    
    required init?(coder: NSCoder){
        super.init(coder: coder)
        initSubviews()
    }
    
    func initSubviews(){
        let nib = UINib(nibName: String(describing: LikesMacDonaldsView.self), bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView
        else{
            fatalError("Error")
        }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
}
