//
//  Menu.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 12/12/23.
//

import Foundation

struct Menu {
    let image: String
    var title: String
    var price: Double
    var modifierGroups: [ModifierGroup]
}

struct ModifierGroup {
    var name: String
    var modifiers: [Modifier]
}

struct Modifier {
    var image: String
    var name: String
    var qty: Int
    var price: Double
}
