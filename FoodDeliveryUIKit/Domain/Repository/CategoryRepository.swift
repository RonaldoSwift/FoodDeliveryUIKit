//
//  CategoryRepository.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 1/11/23.
//

import Foundation
import Combine

class CategoryRepository {
    
    let categoryOfflineService: CategoryOfflineService
    var cancellables = Set<AnyCancellable>()
    
    init(categoryOfflineService: CategoryOfflineService) {
        self.categoryOfflineService = categoryOfflineService
    }
    
    func getCategories() -> AnyPublisher<[Category], Error> {
        return categoryOfflineService.getCategories()
    }
    
    func saveCategories(categories: [Category]) {
        categoryOfflineService.save(categories: categories)
    }
    
}
