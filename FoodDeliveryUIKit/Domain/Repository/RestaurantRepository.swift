//
//  RestaurantRepository.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 7/11/23.
//

import Foundation
import Combine

class RestaurantRepository {
    
    let restaurantDataBaseService: RestaurantDataBaseService
    let memoriaRestaurante: MemoriaRestaurante
    
    var cancellables = Set<AnyCancellable>()
    
    init(
        restaurantDataBaseService: RestaurantDataBaseService,
        memoriaRestaurante: MemoriaRestaurante
    ) {
        self.restaurantDataBaseService = restaurantDataBaseService
        self.memoriaRestaurante = memoriaRestaurante
    }
    
    func getRestaurantsFromDataBase() -> AnyPublisher<[Restaurant], Error> {
        return restaurantDataBaseService.getRestaurant()
    }
    
    func getRestaurantsFromMemoria() -> Array<Restaurant>{
        return memoriaRestaurante.restaurantesData.map { restauranteData in
            let resturante = Restaurant(
                id: restauranteData.id,
                name: restauranteData.name,
                restaurantImage: restauranteData.restaurantImage,
                restaurantLogo: restauranteData.restaurantLogo,
                distance: restauranteData.distance
            )
            return resturante
        }
    }
    
    func saveRestaurants(restaurants:[Restaurant]){
        restaurantDataBaseService.save(restaurants: restaurants)
    }
}
