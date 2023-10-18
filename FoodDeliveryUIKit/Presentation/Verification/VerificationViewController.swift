//
//  VerificationViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo on 18/10/23.
//

import UIKit

class VerificationViewController: UIViewController {
    
    @IBOutlet weak var verificarButton: UIButton!
    @IBOutlet weak var numeroTextField: UITextField!
    @IBOutlet weak var primerDigitoTextField: UITextField!
    @IBOutlet weak var segundoDigitoTextField: UITextField!
    @IBOutlet weak var tercerDigitoTextField: UITextField!
    @IBOutlet weak var cuartoDigitoTextField: UITextField!
    @IBOutlet weak var quintoDigitoTextField: UITextField!
    @IBOutlet weak var sextoDigitoTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        
        primerDigitoTextField.delegate = self
        segundoDigitoTextField.delegate = self
        tercerDigitoTextField.delegate = self
        cuartoDigitoTextField.delegate = self
        quintoDigitoTextField.delegate = self
        sextoDigitoTextField.delegate = self
        
    }
    
    private func setUpViews(){
        verificarButton.setPadding(top: 20, leading: 60, bottom: 20, trailing: 60)
    }
    
    
    @IBAction func verificationButton(_ sender: Any) {
        performSegue(withIdentifier: "", sender: sender)
    }
}

extension VerificationViewController: UITextFieldDelegate{
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        return self.textLimit(exitingText: textField.text, newText: string, limit: 1)
    }
    
    func textLimit(exitingText: String?,newText: String,limit:Int) -> Bool{
        let text = exitingText ?? ""
        let isAtLimit = text.count + newText.count <= limit
        return isAtLimit
    }
}
