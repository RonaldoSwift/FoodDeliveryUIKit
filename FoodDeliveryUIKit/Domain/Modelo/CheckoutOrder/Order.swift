//
//  Order.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 1/12/23.
//

import Foundation

struct Order {
    private var id: String = ""
    private var products: Array<OrderItem> = Array()
    private var payments: Array<Payment> = Array()
    private var subTotal: Int = 0
    private var total: Int = 0
    private var tip: Int = 0
    private var tax: Int = 0
    private var fee: Int = 0
    private var orderStatus: Int = -1
    private var orderDate: Date = Date()
}


