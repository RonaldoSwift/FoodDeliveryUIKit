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
    
    init(id: Int, title: String, isEspecial: Bool) {
        self.id = id
        self.title = title
        self.isEspecial = isEspecial
    }
    
    init(categoryEntity: CategoryEntity) {
        id = Int(categoryEntity.id)
        title = categoryEntity.name ?? ""
        isEspecial = categoryEntity.special
    }
}
