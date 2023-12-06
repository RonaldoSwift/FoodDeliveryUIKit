//
//  AllCategorieRepository.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 5/12/23.
//

import Foundation
import Combine

class AllCategorieRepository{
    
    let memoriaAllCategories: MemoriaAllCategories
    
    var cancelLables = Set<AnyCancellable>()
    
    init(memoriaAllCategories: MemoriaAllCategories) {
        self.memoriaAllCategories = memoriaAllCategories
    }
    
    func getAllCategoriesFromMemoria() -> Array<AllCategorie>{
        return memoriaAllCategories.fastFood.map { (allCategoriesData:AllCategoriesData) in
            let allCategorie = AllCategorie(
                id: allCategoriesData.id,
                imageCategories: allCategoriesData.imageCategories,
                title: allCategoriesData.title
            )
            return allCategorie
        }
    }
}
