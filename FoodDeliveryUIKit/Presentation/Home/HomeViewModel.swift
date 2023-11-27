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
    let hamburguerRestaurantRepository: HamburguerRestaurantRepository
    let restaurantRepository: RestaurantRepository
    
    //@Publish representa el estado d ela vista
    @Published private(set) var categories: [Category] = []
    @Published private(set) var hamburguesas: [HamburguerRestaurant] = []
    @Published private(set) var restaurants: [Restaurant] = []
    
    var cancellables = Set<AnyCancellable>()
    
    init(
        categoryRepository: CategoryRepository,
        hamburguerRestaurantRepository: HamburguerRestaurantRepository,
        repository: RestaurantRepository
    ) {
        self.categoryRepository = categoryRepository
        self.hamburguerRestaurantRepository = hamburguerRestaurantRepository
        self.restaurantRepository = repository
    }
    
    func getCategoriesFromDataBase() {
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
    
    func getHamburguesasFromMemory() {
        let hamburguesasDeMoria = hamburguerRestaurantRepository.getHamburguerRestaurantFromMemoria()
        hamburguesas = hamburguesasDeMoria
    }
    
    func getRestaurantFromMemory() {
        let resturanteDeMoria = restaurantRepository.getRestaurantsFromMemoria()
        restaurants = resturanteDeMoria
    }
    
    // Llenado de base de datos
    func saveCategories() {
        let categories: [Category] = [
            Category(id: 1, title: "Burgers", isEspecial: false, verification: true),
            Category(id: 2, title: "Grocery", isEspecial: false, verification: true),
            Category(id: 3, title: "Salads", isEspecial: false, verification: true),
            Category(id: 4, title: "Swets", isEspecial: false, verification: true),
            Category(id: 5, title: "Utensils", isEspecial: false, verification: true),
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
