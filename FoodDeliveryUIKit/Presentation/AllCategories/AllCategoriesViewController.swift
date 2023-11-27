//
//  AllCategoriesViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 18/11/23.
//

import UIKit

class AllCategoriesViewController: UIViewController {
    
    @IBOutlet weak var allCategoriesCellCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        allCategoriesCellCollectionView.delegate = self
        allCategoriesCellCollectionView.dataSource = self
        
        registerCells()
    }
    
    private func registerCells(){
        let categoryCollectionViewCellNib = UINib(nibName: String(describing: CategoryCollectionViewCell.self), bundle: nil)
        
        allCategoriesCellCollectionView.register(categoryCollectionViewCellNib, forCellWithReuseIdentifier: CategoryCollectionViewCell.identificador)
    }
}

extension AllCategoriesViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == allCategoriesCellCollectionView){
            return 11
        } else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: CategoryCollectionViewCell.identificador, for: indexPath) as!
        CategoryCollectionViewCell
        return cell
    }
}
