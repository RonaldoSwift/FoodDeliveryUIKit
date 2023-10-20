//
//  LoginContainerViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo on 17/10/23.
//

import UIKit

class LoginContainerViewController: UIViewController {
    
    @IBOutlet weak var emailTextFieldView: CustomTextFieldView!
    @IBOutlet weak var passwordTextFieldView: CustomTextFieldView!
    
    var delegate: LoginContainerViewControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextFieldView.title = "Email Address"
        
        if(UserDefaults.standard.bool(forKey: "Logear")){
            performSegue(withIdentifier: "PrincipalTabBarController", sender: nil)
        }
    }
    
    
    @IBAction func clickOnForgotPassword(_ sender: Any) {
        delegate?.clickOnForgotPassword()
    }
    
}


protocol LoginContainerViewControllerDelegate {
    func clickOnForgotPassword()
}
