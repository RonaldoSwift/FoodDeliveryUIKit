//
//  RestaurantViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 8/11/23.
//

import UIKit
import Combine

class RestaurantViewController: UIViewController {
    
    @IBOutlet weak var hamburguerCollectionView: UICollectionView!
    
    var memoriaHamburgerRestaurant = MemoriaHamburgerRestaurant()
    
    var hamburguerRestaurant: [HamburguerRestaurant] = []
    private var subscriptions = Set<AnyCancellable>()
    
    let viewModel: RestaurantViewModel = RestaurantViewModel(
        repository: HamburguerRestaurantRepository(
            memoriaHamburgerRestaurant: MemoriaHamburgerRestaurant()
        )
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        viewModel.getHamburguerRestaurant()
        
        hamburguerCollectionView.delegate = self
        hamburguerCollectionView.dataSource = self
        
        registerCells()
    }
    
    private func setupBindings(){
        viewModel.$hamburguerRestaurant.sink { (hamburguerRestaurant:[HamburguerRestaurant]) in
            self.hamburguerRestaurant = hamburguerRestaurant
            self.hamburguerCollectionView.reloadData()
        }.store(in: &subscriptions)
    }
    
    private func registerCells(){
        
        let hamburguerCollectionViewNib = UINib(nibName: String(describing: FastFoodCollectionViewCell.self), bundle: nil)
        
        hamburguerCollectionView.register(hamburguerCollectionViewNib, forCellWithReuseIdentifier: FastFoodCollectionViewCell.identificador)
    }
}

extension RestaurantViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == hamburguerCollectionView){
            return memoriaHamburgerRestaurant.hamburguers.count
        } else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FastFoodCollectionViewCell.identificador, for: indexPath) as! FastFoodCollectionViewCell
        
       // cell.descriptionLabel.text = hamburguerRestaurant[indexPath.row].title
        return cell
        
    }
}
