//
//  RestaurantViewModel.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 8/11/23.
//

import Foundation
import Combine
import SDWebImage

final class RestaurantViewModel: ObservableObject {
    
    let repository: HamburguerRestaurantRepository
    
    @Published private(set) var hamburguerRestaurant: [HamburguerRestaurant] = []
    
    var cancelLables = Set<AnyCancellable>()
    
    init(repository: HamburguerRestaurantRepository){
        self.repository = repository
    }
    
    func getHamburguerRestaurant() {
        /*
         repository.getHamburguerRestaurantFromDataBase()
         .receive(on: DispatchQueue.main)
         .sink { completion in
         switch completion {
         case .finished:
         break
         case .failure(let error):
         print("Faile to fetch hamburguer restaurants: \(error)")
         }
         } receiveValue: { [weak self] (hamburguerRestaurant: [HamburguerRestaurant]) in
         self?.hamburguerRestaurant = hamburguerRestaurant
         }.store(in: &cancelLables)*/
        
        let hamburguerRestaurantDeMemoria = repository.getHamburguerRestaurantFromMemoria()
        hamburguerRestaurant = hamburguerRestaurantDeMemoria
    }
    
    func saveHamburguerRestaurant(){
        let hamburguerResyaurant: [HamburguerRestaurant] = [
            HamburguerRestaurant(
                id: 1,
                title: "Classic Cheese Hamburger ",
                calories: "(400 Cals)",
                oldPrice: "666",
                currentPrice: "999",
                imageBurguer: "515"
            ), HamburguerRestaurant(
                id: 2,
                title: "Simply Cheese with Sesame Seed buns",
                calories: "(300 Cals)",
                oldPrice: "555",
                currentPrice: "444",
                imageBurguer: "333"
            )
        ]
        repository.saveHamburguerRestaurants(hamburguerRestaurant: hamburguerResyaurant)
    }
}
