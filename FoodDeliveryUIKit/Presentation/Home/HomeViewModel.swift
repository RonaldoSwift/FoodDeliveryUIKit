//
//  HomeViewModel.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 7/11/23.
//

import Foundation
import Combine

final class HomeViewModel: ObservableObject {
    
    let categoryRepository: CategoryRepository
    let restaurantRepository: RestaurantRepository
    
    //@Publish representa el estado d ela vista
    @Published private(set) var categories: [Category] = []
    @Published private(set) var restaurants: [Restaurant] = []
    
    var cancellables = Set<AnyCancellable>()
    
    init(categoryRepository: CategoryRepository, repository: RestaurantRepository) {
        self.categoryRepository = categoryRepository
        self.restaurantRepository = repository
    }
    
    func getRestaurant() {
        let resturanteDeMoria = restaurantRepository.getRestaurantsFromMemoria()
        setRestuarant(arryRESTAURANT: resturanteDeMoria)
    }
    
    func getCategories() {
        categoryRepository.getCategoriesFromDatabase()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Faile to fetch restaurants: \(error)")
                }
            } receiveValue: { (categoriesFromDataBase: [Category]) in
                self.categories = categoriesFromDataBase.sorted(by: { $0.id < $1.id })
            }
            .store(in: &cancellables)
    }
    
    //Es obligatorio tener un seter para cambiar el estado de la vista
    private func setRestuarant(arryRESTAURANT: [Restaurant]){
        restaurants = arryRESTAURANT
    }
    
    // Llenado de base de datos
    func saveCategories() {
        let categories: [Category] = [
            Category(id: 1, title: "CategoryDB1", isEspecial: false, verification: true),
            Category(id: 2, title: "CategoryDB2", isEspecial: false, verification: true),
            Category(id: 3, title: "CategoryDB3", isEspecial: false, verification: true),
            Category(id: 4, title: "CategoryDB4", isEspecial: false, verification: true),
            Category(id: 5, title: "CategoryDB5", isEspecial: false, verification: true),
            Category(id: 6, title: "See all", isEspecial: false, verification: true),
        ]
        categoryRepository.saveCategoriesInDataBase(categories: categories)
    }
    
    func saveRestaurant() {
        let restaurants: [Restaurant] = [
            Restaurant(id: 1, name: "Harvey’s", restaurantImage: "", restaurantLogo: "", distance: "2.1m"),
            Restaurant(id: 2, name: "KFC", restaurantImage: "", restaurantLogo: "", distance: "1.3m")
        ]
        restaurantRepository.saveRestaurants(restaurants: restaurants)
    }
}
