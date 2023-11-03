//
//  CategoryVC+Delegate.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 31/10/23.
//

import Foundation
import UIKit

extension CategoryViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return filteredData.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: String(describing: CategoryCollectionViewCell.self), for: indexPath) as! CategoryCollectionViewCell
        
        cell.descriptionLabel.text = filteredData[indexPath.row].title
       
        return cell
    }
}

extension CategoryViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filteredData = searchText.isEmpty ? viewModel.categories :  viewModel.categories.filter({ (category: Category) in
            return category.title.range(of: searchText, options: .caseInsensitive, range: nil, locale: nil) != nil
        })
    
        categoryCollectionView.reloadData()
    }
}
