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
        let hamburguerRestaurantDeMemoria = repository.getHamburguerRestaurantFromMemoria()
        hamburguerRestaurant = hamburguerRestaurantDeMemoria
    }
}
