//
//  BurguerViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 18/11/23.
//

import UIKit
import Combine

class BurguerViewController: UIViewController {
    
    @IBOutlet weak var burguerFastFoodTableView: UITableView!
    
    private var subscriptions = Set<AnyCancellable>()
    
    let viewModel: BurguerViewModel = BurguerViewModel(burguerRepository: BurguerRepository(memoriaBurguer: MemoriaBurguer())
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        
        viewModel.getBurguerFromMemory()
        
        burguerFastFoodTableView.delegate = self
        burguerFastFoodTableView.dataSource = self
        
        registerCells()
    }
    
    private func setupBindings() {
        viewModel.$burguers.sink { (burguer: [Burguer]) in
            self.burguerFastFoodTableView.reloadData()
        }.store(in: &subscriptions)
    }
    
    
    private func registerCells(){
        let burguerCollectionViewNib = UINib(nibName: String(describing: FoodCellAbductedTableViewCell.self), bundle: nil)
        
        let burguerTableViewNib = UINib(nibName: String(describing: FoodCellTableViewCell.self), bundle: nil)
        
        burguerFastFoodTableView.register(burguerCollectionViewNib, forCellReuseIdentifier: FoodCellAbductedTableViewCell.identificador)
        
        burguerFastFoodTableView.register(burguerTableViewNib, forCellReuseIdentifier: FoodCellTableViewCell.identificador)
        
    }
}
