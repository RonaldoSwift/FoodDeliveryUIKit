//
//  EditAddressViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 18/11/23.
//

import UIKit

class EditAddressViewController: UIViewController {
    
    @IBOutlet weak var editAddressCollectionView: UICollectionView!

    override func viewDidLoad() {
        super.viewDidLoad()

        editAddressCollectionView.delegate = self
        editAddressCollectionView.dataSource = self
        
        registerCells()
    }
    
    private func registerCells(){
        let editAddressCollectionViewNib = UINib(nibName: String(describing: EditAddressCollectionViewCell.self), bundle: nil)
        
        editAddressCollectionView.register(editAddressCollectionViewNib, forCellWithReuseIdentifier: EditAddressCollectionViewCell.identificador)
    }
}

extension EditAddressViewController: UICollectionViewDataSource, UICollectionViewDelegate{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        if(collectionView == editAddressCollectionView){
            return 3
        } else{
            return 0
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: EditAddressCollectionViewCell.identificador, for: indexPath) as!
        EditAddressCollectionViewCell
        return cell
    }
}
