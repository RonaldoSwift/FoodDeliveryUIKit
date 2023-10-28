//
//  CustomClusterAnnotationView.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 27/10/23.
//

import UIKit
import MapKit

class CustomClusterAnnotationView: MKAnnotationView {

    @IBOutlet weak var countLabel: UILabel!
    
    override init(annotation: MKAnnotation?, reuseIdentifier: String?) {
        super.init(annotation: annotation, reuseIdentifier: reuseIdentifier)
        let clusterAnnotation = annotation as? MKClusterAnnotation
        commonInit()
        setUI(with: clusterAnnotation)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInit() {
        let view = self.nibInstantiate(autoResizingMask: [.flexibleHeight, .flexibleWidth])
        self.frame = view.frame
        addSubview(view)
    }
    
    private func setUI(with clusterAnnotation: MKClusterAnnotation?) {
        if let count = clusterAnnotation?.memberAnnotations.count {
            countLabel.text = count.description
        } else {
            countLabel.text = nil
            countLabel.isHidden = true
        }
    }
    
    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */

}
