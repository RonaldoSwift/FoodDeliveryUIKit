//
//  AutenticationViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo on 17/10/23.
//

import UIKit

class AutenticationViewController: UIViewController {
    
    @IBOutlet weak var loginContainerView: UIView!
    @IBOutlet weak var signUpContainerView: UIView!

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func onValueChangedLoginRegister(_ sender: UISegmentedControl) {
        if sender.selectedSegmentIndex == 0{
            loginContainerView.alpha = 1
            signUpContainerView.alpha = 0
        } else{
            loginContainerView.alpha = 0
            signUpContainerView.alpha = 1
        }
    }
    
}
