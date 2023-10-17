//
//  UIButton.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 13/10/23.
//

import Foundation
import UIKit

extension UIButton {
    func setPadding(top: CGFloat, leading: CGFloat, bottom: CGFloat, trailing: CGFloat) {
        self.configuration?.titlePadding = 50
        self.configuration?.contentInsets = NSDirectionalEdgeInsets(top: top, leading: leading, bottom: bottom, trailing: trailing)
    }
    
    func setCornerRadius(cornerStyle: UIButton.Configuration.CornerStyle) {
        self.configuration?.cornerStyle = cornerStyle
    }
    
    func setCornerRadius(radius: CGFloat) {
        self.configuration?.background.cornerRadius = radius
        self.configuration?.cornerStyle = .fixed
    }
}
