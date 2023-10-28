//
//  CustomAnnotation.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 27/10/23.
//

import Foundation
import MapKit

class CustomAnnotation: NSObject, MKAnnotation {
    var coordinate: CLLocationCoordinate2D
    
    init(latitude: Double, longitude: Double) {
        self.coordinate = CLLocationCoordinate2DMake(latitude, longitude)
    }
}
