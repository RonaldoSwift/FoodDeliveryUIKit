//
//  EditAddressViewController+Delegate.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 5/12/23.
//

import Foundation
import UIKit

extension EditAddressViewController: UITableViewDataSource, UITableViewDelegate{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == editAddressTableView){
            return viewModel.editAddress.count
        } else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: EditAddressTableViewCell.identificador, for: indexPath) as!
        EditAddressTableViewCell
        
        cell.nameLabel.text = viewModel.editAddress[indexPath.row].title
        
        cell.homeImage.sd_setImage(with: URL(string: viewModel.editAddress[indexPath.row].imageCategories), placeholderImage: UIImage(named: "DiscoverMacDonals"))
        
        return cell
    }
}
