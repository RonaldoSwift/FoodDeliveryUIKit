//
//  RestaurantDetailsViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Carlos Leonardo Camilo Vargas Huaman on 12/12/23.
//

import UIKit

class RestaurantDetailsViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    var menu = Menu(
        image: "car",
        title: "casd",
        price: 20.10,
        modifierGroups: [
            ModifierGroup(
                name: "Side Item",
                modifiers: [Modifier(image: "Medium", name: "Large Fries", qty: 1, price: 2.99)]
            ),
            ModifierGroup(
                name: "Side Item 2 ",
                modifiers: [Modifier(image: "Medium", name: "Large Fries 2 ", qty: 1, price: 4.99)]
            ),
        ]
    )
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        menuTableView.delegate = self
        menuTableView.dataSource = self
        registerCells()
    }
    
    private func registerCells(){
        menuTableView.register(ModifierHeaderTableViewCell.nib, forCellReuseIdentifier: ModifierHeaderTableViewCell.reuseIdentifier)
        menuTableView.register(ModifierFooterTableViewCell.nib, forCellReuseIdentifier: ModifierFooterTableViewCell.reuseIdentifier)
        menuTableView.register(ModifierTableViewCell.nib, forCellReuseIdentifier: ModifierTableViewCell.reuseIdentifier)
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
