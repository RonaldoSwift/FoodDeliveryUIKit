//
//  Memoria.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo on 17/10/23.
//

import Foundation

class Memoria {
    static var usuario: Array<Usuario> = [Usuario(email: "Luis", password: "1234")]
}

struct Usuario{
    let email: String
    let password: String
}
