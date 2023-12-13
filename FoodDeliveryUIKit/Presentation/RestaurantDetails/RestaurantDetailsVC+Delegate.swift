//
//  RestaurantDetailsVC+Delegate.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 12/12/23.
//

import UIKit


extension RestaurantDetailsViewController: UITableViewDataSource, UITableViewDelegate {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 4
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: ModifierTableViewCell.reuseIdentifier, for: indexPath) as! ModifierTableViewCell
        cell.modifierLabel.text = "Modifier C"
        return cell
    }
    
//    HEADER
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let cell = tableView.dequeueReusableCell(withIdentifier: ModifierHeaderTableViewCell.reuseIdentifier) as! ModifierHeaderTableViewCell
        cell.headerLabel.text = "Section"
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }

    
//    FOOTER
    func tableView(_ tableView: UITableView, viewForFooterInSection section: Int) -> UIView? {
        let footerView = tableView.dequeueReusableCell(withIdentifier: ModifierFooterTableViewCell.reuseIdentifier) as! ModifierFooterTableViewCell
        return footerView
    }

    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        return 30
    }
}

