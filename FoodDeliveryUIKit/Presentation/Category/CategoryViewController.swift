//
//  CategoryViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 31/10/23.
//

import UIKit
import Combine
import CoreData

class CategoryViewController: UIViewController {

    @IBOutlet weak var categoryCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!

    let viewModel: CategoryViewModel = CategoryViewModel(
        repository: CategoryRepository(
            categoryOfflineService: CategoryOfflineService(
                persistentContainer: PersistenceController.shared.container
            )
        )
    )
    
    var filteredData: [Category] = []
    
    private var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Observers
        setupBindings()
        
        // Actions
        viewModel.saveCategories()
        viewModel.getCategories()
        
        // Delegates
        searchBar.delegate = self
        categoryCollectionView.delegate = self
        categoryCollectionView.dataSource = self
        
        // Cells
        registerCells()        
    }
    
    private func setupBindings() {
        viewModel.$categories.sink { (categories: [Category]) in
            self.filteredData = categories
            self.categoryCollectionView.reloadData()
        }.store(in: &subscriptions)
    }
    
    private func registerCells() {
        let nib = UINib(nibName: String(describing: CategoryCollectionViewCell.self), bundle: nil)
        categoryCollectionView.register(nib, forCellWithReuseIdentifier: "CategoryCollectionViewCell")
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
