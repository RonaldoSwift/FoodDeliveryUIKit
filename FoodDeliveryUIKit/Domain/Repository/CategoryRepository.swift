//
//  CategoryRepository.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 1/11/23.
//

import Foundation
import Combine

class CategoryRepository {
    
    let categoryDataBaseService: CategoryDataBaseService
    var cancellables = Set<AnyCancellable>()
    
    init(categoryDataBaseService: CategoryDataBaseService) {
        self.categoryDataBaseService = categoryDataBaseService
    }
    
    func getCategoriesFromDatabase() -> AnyPublisher<[Category], Error> {
        return categoryDataBaseService.getCategories()
    }
    
    func saveCategoriesInDataBase(categories: [Category]) {
        categoryDataBaseService.save(categories: categories)
    }
    
}
