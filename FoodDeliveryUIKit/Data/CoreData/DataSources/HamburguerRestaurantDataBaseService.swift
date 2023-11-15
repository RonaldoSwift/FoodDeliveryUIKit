//
//  HamburguerRestaurantDataBaseService.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 9/11/23.
//

import Foundation
import CoreData
import Combine

class HamburguerRestaurantDataBaseService{
    
    let persistentContainer: NSPersistentContainer
    
    init(persistentContainer: NSPersistentContainer){
        self.persistentContainer = persistentContainer
    }
    
    func getHamburguerRestaurant() -> AnyPublisher< [HamburguerRestaurant],Error> {
        let request: NSFetchRequest<HamburguerEntity> = HamburguerEntity.fetchRequest()
        let context = persistentContainer.viewContext
        
        return Future<[HamburguerRestaurant], Error> { promise in
            do{
                let hamburguerEntityes = try context.fetch(request)
                let hamburguers = hamburguerEntityes.map { (hamburguerEntity:HamburguerEntity) in
                    HamburguerRestaurant(hamburguerEntity: hamburguerEntity)
                }
                promise(.success(hamburguers))
            } catch{
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func save(hamburguers: [HamburguerRestaurant]){
        let context = persistentContainer.newBackgroundContext()
        context.performAndWait {
            do{
                let request: NSFetchRequest<HamburguerEntity> = HamburguerEntity.fetchRequest()
                let existingHamburguerRestaurantEntities = try context.fetch(request)
                let existingHamburguerRestaurantIds = existingHamburguerRestaurantEntities.compactMap { (hamburguerEntity:HamburguerEntity) in
                    Int(hamburguerEntity.id)
                }
                
                hamburguers.forEach { (hamburguerRestaurant:HamburguerRestaurant) in
                    if !existingHamburguerRestaurantIds.contains(hamburguerRestaurant.id) {
                        let hamburguerRestaurantEntity = HamburguerEntity(context: context)
                        hamburguerRestaurantEntity.id = Int64(hamburguerRestaurant.id)
                        hamburguerRestaurantEntity.title = hamburguerRestaurant.title
                        hamburguerRestaurantEntity.calories = hamburguerRestaurant.calories
                        hamburguerRestaurantEntity.oldPrice = hamburguerRestaurant.oldPrice
                        hamburguerRestaurantEntity.currentPrice = hamburguerRestaurant.currentPrice
                        hamburguerRestaurantEntity.imageBurguer = hamburguerRestaurant.imageBurguer
                    }
                }
                try context.save()
            } catch{
                print("Error when saving hamburgers in the data center:\(error)")
            }
        }
    }
}
