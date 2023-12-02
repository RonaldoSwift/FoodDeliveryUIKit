//
//  OrderStatus.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 2/12/23.
//

import Foundation

enum OrderStatus {
    case OFFLINE
    case WAITING_FOR_PAYMENT
    case SENT
    case REFUNDED
    case CANCELLED
    case INCOMPLETE
}
