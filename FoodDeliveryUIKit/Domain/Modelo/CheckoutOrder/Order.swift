//
//  Order.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 1/12/23.
//

import Foundation

struct Order {
    var id: String = UUID().uuidString
    var orderItems: Array<OrderItem> = Array()
    var payments: Array<Payment> = Array()
    var subTotal: Int = 0
    var total: Int = 0
    var tip: Int = 0
    var tax: Int = 0
    var fee: Int = 0
    var orderStatus: Int = -1
    var orderDate: Int64
}


