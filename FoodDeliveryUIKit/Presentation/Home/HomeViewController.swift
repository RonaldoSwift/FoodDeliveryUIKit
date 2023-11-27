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
    
    
    
    //Variable Global
    var resturantes: [Restaurant] = []
    private var subscriptions = Set<AnyCancellable>()

    var categories: [Category] = []
    
    let viewModel: HomeViewModel = HomeViewModel(
        categoryRepository: CategoryRepository(
            categoryDataBaseService: CategoryDataBaseService(
                persistentContainer: PersistenceController.shared.container
            )
        ),
        repository: RestaurantRepository(
            restaurantDataBaseService: RestaurantDataBaseService(
                persistentContainer: PersistenceController.shared.container
            ), 
            memoriaRestaurante: MemoriaRestaurante()
        )
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        
        viewModel.saveCategories()
        viewModel.saveRestaurant()
        
        viewModel.getCategories()
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
//        viewModel.$restaurants.sink { (restaurants: [Restaurant]) in
//            if(restaurants.count == 0){
//                self.viewModel.saveRestaurant()
//            }
//            self.resturantes = restaurants
//            self.restauranteCollectionView.reloadData()
//        }.store(in: &subscriptions)
        
        viewModel.$categories.sink { (categories: [Category]) in
            self.categories = categories
            self.collectionCategoryView.reloadData()
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
