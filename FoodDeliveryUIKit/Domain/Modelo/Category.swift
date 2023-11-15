//
//  Category.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 31/10/23.
//

import Foundation
import CoreData

struct Category: Codable, Identifiable {
    
    let id: Int
    let title: String
    let isEspecial: Bool
    let verification: Bool
    
    init(id: Int, title: String, isEspecial: Bool, verification:Bool) {
        self.id = id
        self.title = title
        self.isEspecial = isEspecial
        self.verification = verification
    }
    
    init(categoryEntity: CategoryEntity) {
        id = Int(categoryEntity.id)
        title = categoryEntity.name ?? ""
        isEspecial = categoryEntity.special
        verification = categoryEntity.verification
    }
}
