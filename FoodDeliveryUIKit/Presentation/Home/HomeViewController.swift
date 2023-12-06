//
//  HomeViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo on 19/10/23.
//

import UIKit
import Combine

class HomeViewController: UIViewController {
    
    @IBOutlet weak var searchTextField: UITextField!
    
    @IBOutlet weak var addressFilterView: FilterView!
    
    @IBOutlet weak var collectionCategoryView: UICollectionView!
    @IBOutlet weak var burguerCollectionView: UICollectionView!
    @IBOutlet weak var restauranteCollectionView: UICollectionView!
    
    //Variable Global
    private var subscriptions = Set<AnyCancellable>()
    
    let viewModel: HomeViewModel = HomeViewModel(
        categoryRepository: CategoryRepository(
            categoryDataBaseService: CategoryDataBaseService(
                persistentContainer: PersistenceController.shared.container
            )
        ),
        hamburguerRestaurantRepository: HamburguerRestaurantRepository(
            memoriaHamburgerRestaurant: MemoriaHamburgerRestaurant())
        ,
        repository: RestaurantRepository(
            restaurantDataBaseService: RestaurantDataBaseService(
                persistentContainer: PersistenceController.shared.container
            ),
            memoriaRestaurante: MemoriaRestaurante()
        )
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //searchTextField.isUserInteractionEnabled = false
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(textFieldDidChange))
        searchTextField.addGestureRecognizer(tapGesture)
        
        let tabGestureAddress = UITapGestureRecognizer(target: self, action: #selector(clickInAddressFilterView))
        addressFilterView.addGestureRecognizer(tabGestureAddress)
        
        
        setupBindings()
        
        viewModel.saveCategories()
        viewModel.saveRestaurant()
        
        viewModel.getCategoriesFromDataBase()
        viewModel.getHamburguesasFromMemory()
        viewModel.getRestaurantFromMemory()
        
        collectionCategoryView.delegate = self
        collectionCategoryView.dataSource = self
        
        burguerCollectionView.delegate = self
        burguerCollectionView.dataSource = self
        
        restauranteCollectionView.delegate = self
        restauranteCollectionView.dataSource = self
        
        registerCells()
    }
    
    private func setupBindings() {
        viewModel.$categories.sink { (categories: [Category]) in
            self.collectionCategoryView.reloadData()
        }.store(in: &subscriptions)
        
        viewModel.$hamburguesas.sink { (categories: [HamburguerRestaurant]) in
            self.burguerCollectionView.reloadData()
        }.store(in: &subscriptions)
        
        viewModel.$restaurants.sink { (restaurants: [Restaurant]) in
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
    
    //Click en cualquier vista objct
    @objc func textFieldDidChange() {
        performSegue(withIdentifier: "SearchSegue", sender: nil)
    }
    
    @objc func clickInAddressFilterView() {
        performSegue(withIdentifier: "EditAddressSegue", sender: nil)
    }
}
