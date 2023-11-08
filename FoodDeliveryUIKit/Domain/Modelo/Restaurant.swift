//
//  Restaurant.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 7/11/23.
//

import Foundation
import CoreData

struct Restaurant: Codable, Identifiable {
    
    let id: Int
    let name: String
    let restaurantImage: String
    let restaurantLogo: String
    let distance: String
    
    init(id: Int, name:String, restaurantImage: String,restaurantLogo: String, distance: String){
        self.id = id
        self.name = name
        self.restaurantImage = restaurantImage
        self.restaurantLogo = restaurantLogo
        self.distance = distance
    }
    
    init(restaurantEntity: RestaurantEntity){
        id = Int(restaurantEntity.id)
        name = restaurantEntity.name ?? ""
        restaurantImage = restaurantEntity.restaurantImage ?? ""
        restaurantLogo = restaurantEntity.restaurantLogo ?? ""
        distance = restaurantEntity.distance ?? ""
    }
}
