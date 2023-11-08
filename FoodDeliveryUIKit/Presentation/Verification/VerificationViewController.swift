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
    
    var irASiguientePantalla: Bool = false

    override func viewDidLoad() {
        super.viewDidLoad()
        setUpViews()
        
        primerDigitoTextField.delegate = self
        segundoDigitoTextField.delegate = self
        tercerDigitoTextField.delegate = self
        cuartoDigitoTextField.delegate = self
        quintoDigitoTextField.delegate = self
        sextoDigitoTextField.delegate = self
        
        if(UserDefaults.standard.bool(forKey: "Logear")){
            performSegue(withIdentifier: "PrincipalTabBarController", sender: nil)
        }
    }
    
    private func setUpViews(){
        verificarButton.setPadding(top: 20, leading: 60, bottom: 20, trailing: 60)
    }
    
    
    @IBAction func verificationButton(_ sender: Any) {
        let primerDigito = primerDigitoTextField.text ?? "Error no se encontro usuario en la memoria"
        let segundoDigito = segundoDigitoTextField.text ?? "Error no se encontro usuario en la memoria"
        let tercerDigito = tercerDigitoTextField.text ?? "Error no se encontro usuario en la memoria"
        let cuartoDigito = cuartoDigitoTextField.text ?? "Error no se encontro usuario en la memoria"
        let quintoDigito = quintoDigitoTextField.text ?? "Error no se encontro usuario en la memoria"
        let sextoDigito = sextoDigitoTextField.text ?? "Error no se encontro usuario en la memoria"
        
        let codigoEncontrado = MemoriaCodigoVerificacion.codigo.first { (codigo:CodigoData) in
            codigo.primerDigitoText == primerDigito && codigo.segundoDigitoText == segundoDigito && codigo.tercerDigitoText == tercerDigito && codigo.cuartoDigitoText == cuartoDigito && codigo.quintoDigitoText == quintoDigito && codigo.sextoDigitoText == sextoDigito
        }
        
        if(codigoEncontrado == nil){
            let alerta = UIAlertController(title: "Error", message: "No se encontro el Usuario", preferredStyle: .alert)
            
            alerta.addAction(UIAlertAction(title: "OK", style: .default,handler: { _ in
                print("Ok tap")
            }))
            present(alerta, animated: true,completion: nil)
        } else{
            UserDefaults.standard.set(true, forKey: "logeado")
            setPrincipalRootViewController()
        }
    }
    
    func setPrincipalRootViewController(){
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let principalTabBarConntroller = storyboard.instantiateViewController(withIdentifier: "PrincipalTabBarController")
        let keyWindow = UIApplication.shared.connectedScenes
            .filter { (escena:UIScene) in
                escena.activationState == .foregroundActive
            }.compactMap { (escena:UIScene) in
                escena as? UIWindowScene
            }.first?.windows
            .filter({ (window:UIWindow) in
                window.isKeyWindow
            }).first
        keyWindow?.rootViewController = principalTabBarConntroller
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
