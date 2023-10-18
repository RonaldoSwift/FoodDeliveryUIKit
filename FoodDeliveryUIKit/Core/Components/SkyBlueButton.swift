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
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(primaryLabel)
        addSubview(iconImageView)
        clipsToBounds = true
        layer.cornerRadius = 20
        layer.borderWidth = 1
        layer.borderColor = UIColor.secondarySystemBackground.cgColor
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        primaryLabel.sizeToFit()
        let iconSize: CGFloat = 30
        let iconRightPadding: CGFloat = 8
        let iconX: CGFloat = (frame.size.width - primaryLabel.frame.size.width - iconSize - iconRightPadding) / 2
        iconImageView.frame = CGRect(
            x: iconX,
            y: (frame.size.height - iconSize) / 2,
            width: iconSize,
            height: iconSize
        )
        
        primaryLabel.frame = CGRect(
            x: iconX + iconSize + iconRightPadding,
            y: 0,
            width: primaryLabel.frame.size.width,
            height: frame.size.height
        )
    }
    
    func configure(text: String, image: UIImage, color: UIColor) {
        primaryLabel.text = text
        iconImageView.image = image
        backgroundColor = color
    }
    
    /*
     // Only override draw() if you perform custom drawing.
     // An empty implementation adversely affects performance during animation.
     override func draw(_ rect: CGRect) {
     // Drawing code
     }
     */
    
}
