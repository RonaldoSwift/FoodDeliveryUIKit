//
//  HomeViewModel.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 7/11/23.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    
    let repository: RestaurantRepository
    
    @Published private(set) var restaurants: [Restaurant] = []
    
    var cancellables = Set<AnyCancellable>()
    
    init(repository: RestaurantRepository) {
        self.repository = repository
    }
    
    func getRestaurant() {
        /*repository.getRestaurantsFromDataBase()
         .receive(on: DispatchQueue.main)
         .sink { completion in
         
         switch completion {
         case .finished:
         break
         case .failure(let error):
         print("Faile to fetch restaurants: \(error)")
         }
         } receiveValue: { [weak self] (restaurants: [Restaurant]) in
         self?.restaurants = restaurants
         }.store(in: &cancellables)*/
        
        let resturanteDeMoria = repository.getRestaurantsFromMemoria()
        restaurants = resturanteDeMoria
    }
    
    func saveRestaurant() {
        let restaurants: [Restaurant] = [
            Restaurant(id: 1, name: "Harvey’s", restaurantImage: "", restaurantLogo: "", distance: "2.1m"),
            Restaurant(id: 2, name: "KFC", restaurantImage: "", restaurantLogo: "", distance: "1.3m")
        ]
        repository.saveRestaurants(restaurants: restaurants)
    }
}
