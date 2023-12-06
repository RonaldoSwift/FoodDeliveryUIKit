//
//  EditAddress.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 5/12/23.
//

import Foundation
import CoreData

struct EditAddress: Codable, Identifiable{
    
    let id: Int
    let imageCategories: String
    let title: String
    
    init(id: Int, imageCategories: String, title: String) {
        self.id = id
        self.imageCategories = imageCategories
        self.title = title
    }
}
