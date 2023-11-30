//
//  SearchViewModel.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 15/11/23.
//

import Foundation
import Combine

final class SearchViewModel: ObservableObject {
    
    let searchRepository: SearchRepository
    
    @Published private(set) var searchs: [Search] = []
    
    var cancellables = Set<AnyCancellable>()
    
    init(searchRepository: SearchRepository) {
        self.searchRepository = searchRepository
    }
    
    func getSearchFromMemory(){
        let searchDeMoria = searchRepository.getSearchFromMemoria()
        searchs = searchDeMoria
    }
}
