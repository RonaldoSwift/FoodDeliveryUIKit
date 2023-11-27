//
//  BurguerViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 18/11/23.
//

import UIKit

class BurguerViewController: UIViewController {
    
    @IBOutlet weak var burguersFasFoodCollectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        burguersFasFoodCollectionView.delegate = self
        burguersFasFoodCollectionView.dataSource = self
        
        registerCells()
    }
    
    private func registerCells(){
        let burguerCollectionViewNib = UINib(nibName: String(describing: BurguersCollectionViewCell.self), bundle: nil)
        
        burguersFasFoodCollectionView.register(burguerCollectionViewNib, forCellWithReuseIdentifier: BurguersCollectionViewCell.identificador)
    }
}

extension BurguerViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == burguersFasFoodCollectionView){
            return 10
        } else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: BurguersCollectionViewCell.identificador, for: indexPath) as!
        BurguersCollectionViewCell
        return cell
    }
}
