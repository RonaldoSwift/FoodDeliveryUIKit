//
//  HamburguerRestaurantRepository.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 9/11/23.
//

import Foundation
import Combine

class HamburguerRestaurantRepository {
    
    let memoriaHamburgerRestaurant: MemoriaHamburgerRestaurant
    
    var cancelLables = Set<AnyCancellable>()
    
    init(memoriaHamburgerRestaurant: MemoriaHamburgerRestaurant) {
        self.memoriaHamburgerRestaurant = memoriaHamburgerRestaurant
    }
    
    func getHamburguerRestaurantFromMemoria() -> Array<HamburguerRestaurant>{
        return memoriaHamburgerRestaurant.hamburguers.map { (hamburguerData:HamburguerData) in
            let hamburguer = HamburguerRestaurant(
                id: hamburguerData.id,
                title: hamburguerData.title,
                calories: hamburguerData.calories,
                oldPrice: hamburguerData.oldPrice,
                currentPrice: hamburguerData.currentPrice,
                imageBurguer: hamburguerData.imageBurguer
            )
            return hamburguer
        }
    }
}
