//
//  SearchRepository.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 29/11/23.
//

import Foundation
import Combine

class SearchRepository{
    
    let memoriaSearch: MemoriaSearch
    
    var cancelLables = Set<AnyCancellable>()
    
    init(memoriaSearch: MemoriaSearch) {
        self.memoriaSearch = memoriaSearch
    }
    
    func getSearchFromMemoria() -> Array<Search>{
        return memoriaSearch.fastFood.map { (searchData:SearchData) in
            let search = Search(
                id: searchData.id,
                imageburguer: searchData.imageburguer,
                title: searchData.title,
                imageLogo: searchData.imageLogo,
                nameMarca: searchData.nameMarca,
                description: searchData.description,
                aceptable: searchData.aceptable
            )
            return search
        }
    }
    
}
