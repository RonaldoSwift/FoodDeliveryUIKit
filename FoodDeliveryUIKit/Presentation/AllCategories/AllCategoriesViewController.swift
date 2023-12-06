//
//  AllCategoriesViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 18/11/23.
//

import UIKit
import Combine

class AllCategoriesViewController: UIViewController {
    
    @IBOutlet weak var allCategoriesCellCollectionView: UICollectionView!
    
    private var subscriptions = Set<AnyCancellable>()
    
    let viewModel: AllCategoriesViewModel = AllCategoriesViewModel(allCategorieRepository: AllCategorieRepository(memoriaAllCategories: MemoriaAllCategories())
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        
        viewModel.getAllCategoriesFromMemory()
        
        allCategoriesCellCollectionView.delegate = self
        allCategoriesCellCollectionView.dataSource = self
        
        registerCells()
    }
    
    private func setupBindings() {
        viewModel.$allCategories.sink { (allCategorie: [AllCategorie]) in
            self.allCategoriesCellCollectionView.reloadData()
        }.store(in: &subscriptions)
    }
    
    private func registerCells(){
        let categoryCollectionViewCellNib = UINib(nibName: String(describing: CategoryCollectionViewCell.self), bundle: nil)
        
        allCategoriesCellCollectionView.register(categoryCollectionViewCellNib, forCellWithReuseIdentifier: CategoryCollectionViewCell.identificador)
    }
}
