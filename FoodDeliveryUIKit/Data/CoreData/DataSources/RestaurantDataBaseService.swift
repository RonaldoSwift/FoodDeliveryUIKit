//
//  RestaurantOfflineService.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 7/11/23.
//

import Foundation
import CoreData
import Combine

class RestaurantDataBaseService{
    
    let persistentContainer: NSPersistentContainer
    
    init(persistentContainer: NSPersistentContainer){
        self.persistentContainer = persistentContainer
    }
    
    func getRestaurant() -> AnyPublisher<[Restaurant], Error>{
        let request: NSFetchRequest<RestaurantEntity> = RestaurantEntity.fetchRequest()
        let context = persistentContainer.viewContext
        
        return Future<[Restaurant], Error>{ promise in
            do{
                let restaurantEntityes = try context.fetch(request)
                let restaurants = restaurantEntityes.map { (restaurantEntity:RestaurantEntity) in
                    Restaurant(restaurantEntity: restaurantEntity)
                }
                promise(.success(restaurants))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func save(restaurants: [Restaurant]){
        let context = persistentContainer.newBackgroundContext()
        context.performAndWait {
            do{
                let request: NSFetchRequest<RestaurantEntity> = RestaurantEntity.fetchRequest()
                let existingRestaurantEntities = try context.fetch(request)
                let existingRestaurantIds = existingRestaurantEntities.compactMap { (restaurantEntity:RestaurantEntity) in
                    Int(restaurantEntity.id)
                }
                restaurants.forEach { (restaurant:Restaurant) in
                    if !existingRestaurantIds.contains(restaurant.id) {
                        let restaurantEntity = RestaurantEntity(context: context)
                        restaurantEntity.id = Int64(restaurant.id)
                        restaurantEntity.name = restaurant.name
                        restaurantEntity.restaurantImage = restaurant.restaurantImage
                        restaurantEntity.restaurantLogo = restaurant.restaurantLogo
                        restaurantEntity.distance = restaurant.distance
                    }
                }
                try context.save()
            } catch{
                print("Error when saving restaurant in the central data: \(error)")
            }
        }
    }
}
