//
//  HomeViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo on 19/10/23.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    @IBOutlet weak var collectionCategoryView: UICollectionView!
    @IBOutlet weak var burguerCollectionView: UICollectionView!
    @IBOutlet weak var restauranteCollectionView: UICollectionView!
    
    var memoriaCategories = MemoriaCategories()
    
    
    //Variable Global
    var resturantes: [Restaurant] = []
    private var subscriptions = Set<AnyCancellable>()

    
    let viewModel: HomeViewModel = HomeViewModel(
        repository: RestaurantRepository(
            restaurantDataBaseService: RestaurantDataBaseService(
                persistentContainer: PersistenceController.shared.container
            ), memoriaRestaurante: MemoriaRestaurante()
        )
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        
        viewModel.getRestaurant()
        
        collectionCategoryView.delegate = self
        collectionCategoryView.dataSource = self
        
        burguerCollectionView.delegate = self
        burguerCollectionView.dataSource = self
        
        restauranteCollectionView.delegate = self
        restauranteCollectionView.dataSource = self
        
        registerCells()
    }
    
    private func setupBindings() {
        viewModel.$restaurants.sink { (restaurants: [Restaurant]) in
            if(restaurants.count == 0){
                self.viewModel.saveRestaurant()
            }
            self.resturantes = restaurants
            self.restauranteCollectionView.reloadData()
        }.store(in: &subscriptions)
    }
    
    private func registerCells(){
        // MARK: - Categoria
        let categoryCollectionnCellNib = UINib(nibName: String(describing: CategoryCollectionViewCell.self), bundle: nil)
        
        collectionCategoryView.register(categoryCollectionnCellNib, forCellWithReuseIdentifier: CategoryCollectionViewCell.identificador)
        
        let seeAllCollectionnCellNib = UINib(nibName: String(describing: SeeAllCollectionViewCell.self), bundle: nil)
        
        collectionCategoryView.register(seeAllCollectionnCellNib, forCellWithReuseIdentifier: SeeAllCollectionViewCell.identificador)
        
        // MARK: - Burguer

        let burguerCollectionViewCellNib = UINib(nibName: String(describing: BurguerCategoryCollectionViewCell.self), bundle: nil)
        
        burguerCollectionView.register(burguerCollectionViewCellNib, forCellWithReuseIdentifier: BurguerCategoryCollectionViewCell.identificador)
        
        // MARK: - Resturant

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
            return resturantes.count
        } else{
            return 0
        }
    }
    
    //Create a function that adds two integers together
    
    //Hacer similar, con la nueva celda
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        //See All logica
        if(collectionView == collectionCategoryView){
            if(memoriaCategories.categorias[indexPath.row].nombre != "See all"){
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identificador, for: indexPath) as! CategoryCollectionViewCell
                
                // "cell.imageView
                cell.descriptionLabel.text = memoriaCategories.categorias[indexPath.row].nombre
                return cell
            } else{
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SeeAllCollectionViewCell.identificador, for: indexPath) as! SeeAllCollectionViewCell
                
                return cell
            }
            
        } else if(collectionView == burguerCollectionView){
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BurguerCategoryCollectionViewCell.identificador, for: indexPath) as! BurguerCategoryCollectionViewCell
            
            return cell
        } else {
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: RestaurantBrandCollectionViewCell.identificador, for: indexPath) as! RestaurantBrandCollectionViewCell
            
            cell.nameRestaurantLabel.text = resturantes[indexPath.row].name

            return cell
        }
    }
}
