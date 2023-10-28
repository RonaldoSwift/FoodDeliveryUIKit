//
//  HomeViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo on 19/10/23.
//

import UIKit

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionCategoryView: UICollectionView!
    @IBOutlet weak var burguerCollectionView: UICollectionView!
    @IBOutlet weak var restauranteCollectionView: UICollectionView!
    
    var memoriaCategories = MemoriaCategories()
    var memoriaRestaurante = MemoriaRestaurante()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionCategoryView.delegate = self
        collectionCategoryView.dataSource = self
        
        burguerCollectionView.delegate = self
        burguerCollectionView.dataSource = self
        
        restauranteCollectionView.delegate = self
        restauranteCollectionView.dataSource = self
        
        registerCells()
    }
    
    private func registerCells(){
        let categoryCollectionnCellNib = UINib(nibName: String(describing: CategoryCollectionViewCell.self), bundle: nil)
        
        collectionCategoryView.register(categoryCollectionnCellNib, forCellWithReuseIdentifier: CategoryCollectionViewCell.identificador)
        
        
        let burguerCollectionViewCellNib = UINib(nibName: String(describing: BurguerCategoryCollectionViewCell.self), bundle: nil)
        
        burguerCollectionView.register(burguerCollectionViewCellNib, forCellWithReuseIdentifier: BurguerCategoryCollectionViewCell.identificador)
        
        let restauranteCollectionViewCellNib = UINib(nibName: String(describing: RestaurantBrandCollectionViewCell.self), bundle: nil)
        
        restauranteCollectionView.register(restauranteCollectionViewCellNib, forCellWithReuseIdentifier: RestaurantBrandCollectionViewCell.identificador)
    }
}


extension HomeViewController: UICollectionViewDataSource,UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == collectionCategoryView){
            return memoriaCategories.categorias.count
        } else if(collectionView == burguerCollectionView){
            return 5
        } else if(collectionView == restauranteCollectionView){
            return memoriaRestaurante.restaurantes.count
        } else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        if(collectionView == collectionCategoryView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identificador, for: indexPath) as! CategoryCollectionViewCell
            
            // "cell.imageView
            cell.descriptionLabel.text = memoriaCategories.categorias[indexPath.row].nombre
            return cell
        } else if(collectionView == burguerCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BurguerCategoryCollectionViewCell.identificador, for: indexPath) as! BurguerCategoryCollectionViewCell
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantBrandCollectionViewCell.identificador, for: indexPath) as! RestaurantBrandCollectionViewCell
            
            cell.nameRestaurantLabel.text = memoriaRestaurante.restaurantes[indexPath.row].nombre
            
            return cell
        }
    }
}
