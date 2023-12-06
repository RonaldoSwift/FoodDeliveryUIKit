//
//  EditAddressViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo Andre on 18/11/23.
//

import UIKit
import Combine

class EditAddressViewController: UIViewController {
    
    @IBOutlet weak var editAddressTableView: UITableView!
    
    private var subscriptions = Set<AnyCancellable>()

    let viewModel: EditAddressViewModel = EditAddressViewModel(editAddressRepository: EditAddressRepository(memoriaEditAdress: MemoriaEditAdress())
    )

    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupBindings()
        
        viewModel.getEditAddressFromMemory()

        editAddressTableView.delegate = self
        editAddressTableView.dataSource = self
        
        registerCells()
    }
    
    private func setupBindings(){
        viewModel.$editAddress.sink { (editAddress:[EditAddress]) in
            self.editAddressTableView.reloadData()
        }.store(in: &subscriptions)
    }
    
    private func registerCells(){
        
        let editAddressTableViewNib = UINib(nibName: String(describing: EditAddressTableViewCell.self), bundle: nil)
        
        editAddressTableView.register(editAddressTableViewNib, forCellReuseIdentifier: EditAddressTableViewCell.identificador)
    }
}
