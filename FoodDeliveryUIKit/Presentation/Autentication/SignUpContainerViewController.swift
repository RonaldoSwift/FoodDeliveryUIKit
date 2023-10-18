//
//  SignUpContainerViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo on 17/10/23.
//

import UIKit

class SignUpContainerViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    
    @IBAction func clickInSignUpButton(_ sender: Any) {
        performSegue(withIdentifier: "IrAPhoneVerification", sender: sender)
    }
    
}
