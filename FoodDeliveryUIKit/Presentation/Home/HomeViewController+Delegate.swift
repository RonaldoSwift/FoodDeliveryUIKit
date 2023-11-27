//
//  HomeViewController+Delegate.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 26/11/23.
//

import UIKit

extension HomeViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == collectionCategoryView){
            return viewModel.categories.count
        } else if(collectionView == burguerCollectionView){
            return viewModel.hamburguesas.count
        } else if(collectionView == restauranteCollectionView){
            return viewModel.restaurants.count
        } else{
            return 0
        }
    }
    
    //Create a function that adds two integers together
    
    //Hacer similar, con la nueva celda
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //See All logica
        if(collectionView == collectionCategoryView){
            if(viewModel.categories[indexPath.row].title != "See all"){
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identificador, for: indexPath) as! CategoryCollectionViewCell
                
                // "cell.imageView
                cell.descriptionLabel.text = viewModel.categories[indexPath.row].title
                return cell
            } else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeeAllCollectionViewCell.identificador, for: indexPath) as! SeeAllCollectionViewCell
                
                return cell
            }
            
        } else if(collectionView == burguerCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BurguerCategoryCollectionViewCell.identificador, for: indexPath) as! BurguerCategoryCollectionViewCell
            
            cell.burguerImageView.sd_setImage(
                with: URL(string: viewModel.hamburguesas[indexPath.row].imageBurguer),
                placeholderImage: UIImage(named: "Cluster")
            )
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantBrandCollectionViewCell.identificador, for: indexPath) as! RestaurantBrandCollectionViewCell
            
            cell.nameRestaurantLabel.text = viewModel.restaurants[indexPath.row].name
            
            return cell
        }
    }
    
    //    MARK: - Click on cells
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        if(collectionView == collectionCategoryView) {
            if(self.viewModel.categories[indexPath.row].title == "See all") {
                performSegue(withIdentifier: "AllCategoriesSegue", sender: nil)
            }
        }
    }
}
