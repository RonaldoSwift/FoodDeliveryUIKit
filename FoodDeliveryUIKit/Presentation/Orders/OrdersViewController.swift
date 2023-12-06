//
//  OrdersViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 30/11/23.
//

import UIKit
import Combine

class OrdersViewController: UIViewController {

    
    @IBOutlet weak var orderTableView: UITableView!
    
    let viewModel = OrdersViewModel()
    
    //Variable Global
    private var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()

        orderTableView.delegate = self
        orderTableView.dataSource = self
        
        setupBindings()
        
        registerCells()
    }
    
    private func setupBindings() {
        viewModel.$orders.sink { (orders: [Order]) in
            self.orderTableView.reloadData()
        }.store(in: &subscriptions)
    }
    
    private func registerCells(){
        
        let orderTableViewCellNib = UINib(nibName: String(describing: OrderTableViewCell.self), bundle: nil)
        orderTableView.register(orderTableViewCellNib, forCellReuseIdentifier: OrderTableViewCell.identificador)
        
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
