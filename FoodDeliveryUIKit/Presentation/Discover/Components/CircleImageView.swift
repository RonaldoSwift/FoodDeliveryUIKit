//
//  CircleImageView.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 27/10/23.
//

import UIKit

@IBDesignable
class CircleImageView: UIImageView {
    
    @IBInspectable
       var circle: Bool {
           set {
               self.isCircle = newValue
               self.setCircle()
           }
           get { self.isCircle }
       }
       
       private var isCircle: Bool = false

       private func setCircle() {
           if isCircle {
               layer.cornerRadius = bounds.size.width / 2
           }
       }
}
