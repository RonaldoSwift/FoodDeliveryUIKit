//
//  SocialNetwork.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 18/10/23.
//

import Foundation

enum SocialNetwork: String {
case FACEBOOK = "facebook"
case GOOGLE = "google"
case APPLE = "apple"
case DEFAULT = "default"
    
    var value: Int {
        switch self {
        case .FACEBOOK:
            return 1
        case .GOOGLE:
            return 2
        case .APPLE:
            return 3
        case .DEFAULT:
            return 0
        }
    }
}
