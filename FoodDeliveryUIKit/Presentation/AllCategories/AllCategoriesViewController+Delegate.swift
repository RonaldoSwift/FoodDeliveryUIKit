//
//  AllCategoriesViewController+Delegate.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 5/12/23.
//

import Foundation
import UIKit

extension AllCategoriesViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == allCategoriesCellCollectionView){
            return viewModel.allCategories.count
        } else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identificador, for: indexPath) as!
        CategoryCollectionViewCell
        
        cell.descriptionLabel.text = viewModel.allCategories[indexPath.row].title
        
        cell.imageView.sd_setImage(with: URL(string: viewModel.allCategories[indexPath.row].imageCategories), placeholderImage: UIImage(named: "DiscoverMacDonals"))
        
        return cell
    }
}
