//
//  CategoryOfflineService.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 1/11/23.
//

import Foundation
import CoreData
import Combine

class CategoryOfflineService {
    
    let persistentContainer: NSPersistentContainer
    
    init(persistentContainer: NSPersistentContainer) {
        self.persistentContainer = persistentContainer
    }
    
    func getCategories() -> AnyPublisher<[Category], Error> {
        let request: NSFetchRequest<CategoryEntity> = CategoryEntity.fetchRequest()
        let context = persistentContainer.viewContext
        
        return Future<[Category], Error> { promise in
            do {
                let categoryEntities = try context.fetch(request)
                let categories = categoryEntities.map { (categoryEntity: CategoryEntity) in
                    Category(categoryEntity: categoryEntity)
                }
                promise(.success(categories))
            } catch {
                promise(.failure(error))
            }
        }
        .eraseToAnyPublisher()
    }
    
    func save(categories: [Category]) {
        let context = persistentContainer.newBackgroundContext()
        context.performAndWait {
            do {
                let request: NSFetchRequest<CategoryEntity> = CategoryEntity.fetchRequest()
                let existingCategoryEntities = try context.fetch(request)
                let existingCategoryIds = existingCategoryEntities.compactMap { (categoryEntity: CategoryEntity) in
                    Int(categoryEntity.id)
                }
                categories.forEach { (category: Category) in
                    if !existingCategoryIds.contains(category.id) {
                        let categoryEntity = CategoryEntity(context: context)
                        categoryEntity.id = Int64(category.id)
                        categoryEntity.name = category.title
                        categoryEntity.special = category.isEspecial
                    }
                }
                try context.save()
            } catch {
                print("Failed to save categories to core data: \(error)")
            }
        }
    }
    
}
