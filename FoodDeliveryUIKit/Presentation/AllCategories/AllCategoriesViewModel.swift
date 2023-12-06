//
//  AllCategoriesViewModel.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 18/11/23.
//

import Foundation
import Combine

final class AllCategoriesViewModel: ObservableObject {
    
    let allCategorieRepository: AllCategorieRepository
    
    @Published private(set) var allCategories: [AllCategorie] = []
    
    var cancellables = Set<AnyCancellable>()
    
    init(allCategorieRepository: AllCategorieRepository) {
        self.allCategorieRepository = allCategorieRepository
    }
    
    func getAllCategoriesFromMemory(){
        let allCategorieMoria = allCategorieRepository.getAllCategoriesFromMemoria()
        allCategories = allCategorieMoria
    }
}
