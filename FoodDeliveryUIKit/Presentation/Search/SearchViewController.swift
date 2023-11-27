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
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fastFoodCelTableView.delegate = self
        fastFoodCelTableView.dataSource = self
        
        registerCells()
        
    }
    
    private func registerCells(){
        let fastFoodTableViewNib = UINib(nibName: String(describing: FoodCellAbductedTableViewCell.self), bundle: nil)
        
        fastFoodCelTableView.register(fastFoodTableViewNib, forCellReuseIdentifier: FoodCellAbductedTableViewCell.identificador)
    }
}

extension SearchViewController: UITableViewDataSource, UITableViewDelegate{
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView == fastFoodCelTableView){
            return 5
        } else{
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: FoodCellAbductedTableViewCell.identificador, for: indexPath) as! FoodCellAbductedTableViewCell
        
        return cell
    }
}
