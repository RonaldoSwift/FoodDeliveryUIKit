//
//  CustomAnnotationView.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 27/10/23.
//

import UIKit
import MapKit

class CustomAnnotationView: MKAnnotationView {

    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(code:) has not been implemented")
    }
    
    private func commonInit() {
        let view = self.nibInstantiate(autoResizingMask: [.flexibleHeight, .flexibleWidth])
        self.frame = view.frame
        addSubview(view)
        
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
