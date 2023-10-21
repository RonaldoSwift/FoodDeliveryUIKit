//
//  SkyBlueButton.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 18/10/23.
//

import UIKit

class SkyBlueButton: UIButton {
    
    private let primaryLabel: UILabel = {
        let label = UILabel()
        label.numberOfLines = 1
        label.textAlignment = .center
        label.textColor = .white
        label.font = .systemFont(ofSize: 20, weight: .semibold)
        return label
    }()
    
    private let iconImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.tintColor = .white
        imageView.contentMode = .scaleAspectFit
        imageView.clipsToBounds = true
        return imageView
    }()
    
    override init(frame: CGRect) { // Always works with required init, called when running init() or  init(frame)
        super.init(frame: frame)
        backgroundColor = .systemBlue
        addSubview(primaryLabel)
        addSubview(iconImageView)
        clipsToBounds = true
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondarySystemBackground.cgColor
    }

    required init?(coder: NSCoder) { // This is used to load a button from Interface Builder
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        primaryLabel.sizeToFit()
        let iconSize: CGFloat = 30
        let iconRightPadding: CGFloat = 18
        let labelX: CGFloat = (frame.size.width - primaryLabel.frame.size.width) / 2
        let iconX: CGFloat = (frame.size.width + primaryLabel.frame.size.width + iconRightPadding) / 2
        
        primaryLabel.frame = CGRect(
            x: labelX,
            y: 0,
            width: primaryLabel.frame.size.width,
            height: frame.size.height
        )
        
        iconImageView.frame = CGRect(
            x: iconX,
            y: (frame.size.height - iconSize) / 2,
            width: iconSize,
            height: iconSize
        )
    }
    
    func configure(text: String, image: UIImage) {
        primaryLabel.text = text
        iconImageView.image = image
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
