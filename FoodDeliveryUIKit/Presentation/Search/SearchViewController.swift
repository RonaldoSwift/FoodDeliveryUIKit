//
//  SearchViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 15/11/23.
//

import UIKit
import Combine

class SearchViewController: UIViewController {
    
    @IBOutlet weak var fastFoodCelTableView: UITableView!
    
    private var subscriptions = Set<AnyCancellable>()
    
    let viewModel: SearchViewModel = SearchViewModel(searchRepository: SearchRepository(memoriaSearch: MemoriaSearch())
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        
        viewModel.getSearchFromMemory()
        
        fastFoodCelTableView.delegate = self
        fastFoodCelTableView.dataSource = self
        
        registerCells()
        
    }
    
    private func setupBindings() {
        viewModel.$searchs.sink { (search: [Search]) in
            self.fastFoodCelTableView.reloadData()
        }.store(in: &subscriptions)
    }
    
    
    private func registerCells(){
        
        let fastFoodTableViewNib = UINib(nibName: String(describing: FoodCellAbductedTableViewCell.self), bundle: nil)
        
        let foodTableViewNib = UINib(nibName: String(describing: FoodCellTableViewCell.self), bundle: nil)
        
        fastFoodCelTableView.register(fastFoodTableViewNib, forCellReuseIdentifier: FoodCellAbductedTableViewCell.identificador)
        
        fastFoodCelTableView.register(foodTableViewNib, forCellReuseIdentifier: FoodCellTableViewCell.identificador)
        
    }
}
