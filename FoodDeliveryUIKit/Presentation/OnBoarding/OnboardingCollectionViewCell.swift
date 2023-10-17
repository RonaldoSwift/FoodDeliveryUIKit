//
//  OnboardingCollectionViewCell.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 16/10/23.
//

import UIKit

class OnboardingCollectionViewCell: UICollectionViewCell {
    
    static let identifier = String(describing: OnboardingCollectionViewCell.self)
    
    @IBOutlet weak var slideImageView: UIImageView!
    @IBOutlet weak var slideTitleLabel: UILabel!
    @IBOutlet weak var slideDescriptionLabel: UILabel!
    
    func setup(_ onboardingSlide: OnboardingSlide) {
        slideImageView.image = onboardingSlide.image
        slideTitleLabel.text = onboardingSlide.title
        slideDescriptionLabel.text = onboardingSlide.description
    }
    
}
