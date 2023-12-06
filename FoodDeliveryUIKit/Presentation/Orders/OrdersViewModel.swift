//
//  OrderViewModel.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 4/12/23.
//

import Foundation

final class OrdersViewModel: ObservableObject {
    
    @Published private(set) var orders: [Order] = []
    
    
}
