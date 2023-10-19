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
    
    var comunicateDelegate: ComunicateDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        emailTextFieldView.title = "Email Address"
        
        if(UserDefaults.standard.bool(forKey: "Logear")){
            performSegue(withIdentifier: "PrincipalTabBarController", sender: nil)
        }
    }
    
    
    @IBAction func clickInButtonLogin(_ sender: Any) {
        
        comunicateDelegate?.clickOnLogin()
        
        /*let email = emailAddressTextField.text ?? "Error no se encontro usuario en la memoria"
        let password = passwordTextField.text ?? "Error pasword incorrecto"
        
        
        let usuarioEncontrado = Memoria.usuario.first { (usuario:Usuario) in
            usuario.email == email && usuario.password == password
        }
        
        if(usuarioEncontrado == nil){
            let alerta = UIAlertController(title: "Error", message: "No se encontro el Usuario", preferredStyle: .alert)
            
            alerta.addAction(UIAlertAction(title: "OK", style: .default,handler: { _ in
                print("Ok tap")
            }))
            present(alerta, animated: true,completion: nil)
        } else{
            UserDefaults.standard.set(true, forKey: "logeado")
            setPrincipalRootViewController()
        }*/
        
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


protocol ComunicateDelegate {
    func clickOnLogin()
}
