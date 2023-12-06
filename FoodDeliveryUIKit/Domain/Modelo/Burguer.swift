//
//  Burguer.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 4/12/23.
//

import Foundation
import CoreData

struct Burguer: Codable, Identifiable{
    
    let id: Int
    let imageburguer : String
    let title: String
    let imageLogo: String
    let nameMarca: String
    let description: String
    let aceptable: Bool
    
    init(id: Int, imageburguer: String, title: String, imageLogo: String, nameMarca: String, description: String, aceptable: Bool) {
        self.id = id
        self.imageburguer = imageburguer
        self.title = title
        self.imageLogo = imageLogo
        self.nameMarca = nameMarca
        self.description = description
        self.aceptable = aceptable
    }
}
