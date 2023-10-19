//
//  SocialNetworkView.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 18/10/23.
//

import UIKit

protocol SocialNetworkViewDelegate {
    func onClickSocialNetwork()
}

@IBDesignable
class SocialNetworkView: UIView {
    
    static let identifier = "SocialNetworkView"
    
    var delegate: SocialNetworkViewDelegate?
    var socialNetworkValue = SocialNetwork.DEFAULT
    
    @IBOutlet weak var socialNetworkButton: UIButton!
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    
    @IBInspectable
    var image: UIImage? {
        didSet {
            socialNetworkButton.setImage(image, for: .normal)
        }
    }
    
    @IBInspectable
    var loading: Bool = false {
        didSet {
            socialNetworkButton.isHidden = loading
            activityIndicatorView.isHidden = !loading
            activityIndicatorView.startAnimating()
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
    
    func initSubviews() {
        let nib = UINib(nibName: SocialNetworkView.identifier, bundle: nil)
        guard let view = nib.instantiate(withOwner: self, options: nil).first as? UIView else {
            fatalError("Unable to convert nib")
        }
        view.frame = bounds
        view.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        addSubview(view)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        socialNetworkButton.clipsToBounds = true
        socialNetworkButton.backgroundColor = .clear
        socialNetworkButton.layer.borderWidth = 1
        socialNetworkButton.layer.borderColor = UIColor.black.cgColor
    }
    
    
    @IBAction func startLogin(_ sender: Any) {
        delegate?.onClickSocialNetwork()
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
