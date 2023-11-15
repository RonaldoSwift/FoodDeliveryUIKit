//
//  HamburguerRestaurant.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 9/11/23.
//

import Foundation
import CoreData

struct HamburguerRestaurant: Codable, Identifiable{
    
    let id: Int
    let title: String
    let calories: String
    let oldPrice: String
    let currentPrice: String
    let imageBurguer: String
    
    init(id: Int, title: String, calories: String, oldPrice: String, currentPrice: String, imageBurguer: String) {
        self.id = id
        self.title = title
        self.calories = calories
        self.oldPrice = oldPrice
        self.currentPrice = currentPrice
        self.imageBurguer = imageBurguer
    }
    
    init(hamburguerEntity: HamburguerEntity){
        id = Int(hamburguerEntity.id)
        title = hamburguerEntity.title ?? ""
        calories = hamburguerEntity.calories ?? ""
        oldPrice = hamburguerEntity.oldPrice ?? ""
        currentPrice = hamburguerEntity.currentPrice ?? ""
        imageBurguer = hamburguerEntity.imageBurguer ?? ""
    }
}
