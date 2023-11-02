//
//  CategoryViewModel.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 1/11/23.
//

import Foundation
import Combine

final class CategoryViewModel: ObservableObject {
    
    // Dependencies
    let repository: CategoryRepository
    
    // Publishers
    @Published private(set) var categories: [Category] = [] // this is for SwiftUI and UIKit (1)
    // let categoriesWillChange = PassthroughSubject<Void, Never>() // You can use types of publishers to notify the view (3)
    var cancellables = Set<AnyCancellable>()
    
    init(repository: CategoryRepository) {
        self.repository = repository
    }
    
    func getCategories() {
        repository.getCategories()
            .receive(on: DispatchQueue.main)
            .sink { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print("Faile to fetch categories: \(error)")
                }
            } receiveValue: { [weak self] (categories: [Category]) in
                //self?.objectWillChange.send() // You can use the objectWillChange to notify the view (2)
                self?.categories = categories
            }.store(in: &cancellables)
    }
    
    func saveCategories() {
        let categories: [Category] = [
            Category(id: 1, title: "Burgers", isEspecial: true),
            Category(id: 2, title: "Grocery", isEspecial: true),
        ]
        repository.saveCategories(categories: categories)
    }
    
}
