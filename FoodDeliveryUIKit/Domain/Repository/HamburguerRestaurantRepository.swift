//
//  HamburguerRestaurantRepository.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 9/11/23.
//

import Foundation
import Combine

class HamburguerRestaurantRepository {
    
    let hamburguerRestaurantDataBaseService: HamburguerRestaurantDataBaseService
    let memoriaHamburgerRestaurant: MemoriaHamburgerRestaurant
    
    var cancelLables = Set<AnyCancellable>()
    
    init(hamburguerRestaurantDataBaseService: HamburguerRestaurantDataBaseService, memoriaHamburgerRestaurant: MemoriaHamburgerRestaurant) {
        self.hamburguerRestaurantDataBaseService = hamburguerRestaurantDataBaseService
        self.memoriaHamburgerRestaurant = memoriaHamburgerRestaurant
    }
    
    func getHamburguerRestaurantFromDataBase() -> AnyPublisher<[HamburguerRestaurant],Error>{
        return hamburguerRestaurantDataBaseService.getHamburguerRestaurant()
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
    
    func saveHamburguerRestaurants(hamburguerRestaurant: [HamburguerRestaurant]){
        hamburguerRestaurantDataBaseService.save(hamburguers: hamburguerRestaurant)
    }
}
