//
//  MemoriaCategories.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo on 27/10/23.
//

import Foundation

class MemoriaCategories{
    var categorias: Array<Categoria> = [Categoria(nombre: "Burguer"),
                                        Categoria(nombre: "Grocery"),
                                        Categoria(nombre: "Salads"),
                                        Categoria(nombre: "Sweets"),
                                        Categoria(nombre: "Utensils"),
                                        Categoria(nombre: "See all")]
}

struct Categoria{
    let nombre: String
}
