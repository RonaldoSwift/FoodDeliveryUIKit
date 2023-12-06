//
//  OrdersViewController+Delegate.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 30/11/23.
//

import UIKit
import SDWebImage

extension OrdersViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.orders.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: OrderTableViewCell.identificador, for: indexPath) as! OrderTableViewCell
        
        cell.titleLabel.text = viewModel.orders[indexPath.row].id
        cell.descriptionLabel.text = String(viewModel.orders[indexPath.row].orderDate)
        cell.priceLabel.text = String(viewModel.orders[indexPath.row].total)
        return cell
    }
    
}

