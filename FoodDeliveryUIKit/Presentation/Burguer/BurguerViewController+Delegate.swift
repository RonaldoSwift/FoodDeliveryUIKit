//
//  BurguerViewController+Delegate.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 4/12/23.
//

import Foundation
import UIKit

extension BurguerViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == burguerFastFoodTableView){
            return viewModel.burguers.count
        } else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if(viewModel.burguers[indexPath.row].aceptable == true){
            let cell = tableView.dequeueReusableCell(withIdentifier: FoodCellAbductedTableViewCell.identificador, for: indexPath) as! FoodCellAbductedTableViewCell
            
            cell.tituloLabel.text = viewModel.burguers[indexPath.row].title
            
            cell.foodImageView.sd_setImage(with: URL(string: viewModel.burguers[indexPath.row].imageburguer), placeholderImage: UIImage(named: "DiscoverMacDonals"))
            
            return cell
        } else{
            let cell = tableView.dequeueReusableCell(withIdentifier: FoodCellTableViewCell.identificador, for: indexPath) as! FoodCellTableViewCell
            
            cell.tituloLabel.text = viewModel.burguers[indexPath.row].title
            
            cell.marcaImageView.sd_setImage(with: URL(string: viewModel.burguers[indexPath.row].imageburguer), placeholderImage: UIImage(named: "DiscoverMacDonals"))
            return cell
        }
    }
}
