//
//  AutenticationViewController.swift
//  FoodDeliveryUIKit
//
//  Created by Ronaldo on 17/10/23.
//

import UIKit

class AutenticationViewController: UIViewController {
    
    
    @IBOutlet weak var segmentedControl: UISegmentedControl!
    
    @IBOutlet weak var loginContainerView: UIView!
    @IBOutlet weak var signUpContainerView: UIView!
    
    @IBOutlet weak var googleSocialNetworkButtonView: SocialNetworkButtonView!
    @IBOutlet weak var appleSocialNetworkButtonView: SocialNetworkButtonView!
    @IBOutlet weak var facebookSocialNetworkButtonView: SocialNetworkButtonView!
    
    private var loginContainerViewController: LoginContainerViewController!
    private var signUpContainerViewController: SignUpContainerViewController!
    
    private let skyBlueButton: SkyBlueButton = {
        let skyBlueButton = SkyBlueButton(frame: CGRect(x: 0, y: 0, width: 220, height: 55))
        skyBlueButton.configure(text: "Next", image: UIImage(systemName: "cart")!)
        return skyBlueButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIComponents()
        setUpViewListeners()
    }
    
    // MARK: - OLD WAY TO HANDLE CONSTRAINTS - Visual Format Language (or VFL).
    //    override func viewDidLayoutSubviews() {
    //
    //        let widthContraints =  NSLayoutConstraint(item: skyBlueButton, attribute: NSLayoutConstraint.Attribute.width, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40)
    //
    //        let heightContraints = NSLayoutConstraint(item: skyBlueButton, attribute: NSLayoutConstraint.Attribute.height, relatedBy: NSLayoutConstraint.Relation.equal, toItem: nil, attribute: NSLayoutConstraint.Attribute.notAnAttribute, multiplier: 1, constant: 40)
    //
    //        let xContraints = NSLayoutConstraint(item: skyBlueButton, attribute: NSLayoutConstraint.Attribute.bottomMargin, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.bottomMargin, multiplier: 1, constant: -20)
    //
    //        let yContraints = NSLayoutConstraint(item: skyBlueButton, attribute: NSLayoutConstraint.Attribute.trailing, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.trailing, multiplier: 1, constant: -20)
    //
    //        NSLayoutConstraint.activate([heightContraints,widthContraints,xContraints,yContraints])
    //    }
    
    
    // MARK: - NEW WAY TO HANDLE CONSTRAINTS - Anchors
    private func setUpUIComponents() {
        view.addSubview(skyBlueButton)
        skyBlueButton.translatesAutoresizingMaskIntoConstraints = false
        skyBlueButton.widthAnchor.constraint(equalToConstant: loginContainerView.frame.width).isActive = true
        skyBlueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        skyBlueButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        //        skyBlueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        skyBlueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
    }
    
    private func setUpViewListeners() {
        skyBlueButton.addTarget(self, action: #selector(clickOnNextButton), for: .touchUpInside)
    }
    
    @objc func clickOnNextButton() {
        if(segmentedControl.selectedSegmentIndex == 0) {
            // DO LOGIN
            startLogin(
                email: loginContainerViewController.emailTextFieldView.getText(),
                password: loginContainerViewController.passwordTextFieldView.getText()
            )
        } else {
            // DO REGISTER
            // DO LOGIN
            
            startSignUp(
                email: signUpContainerViewController.emailTextFieldView.getText(),
                phoneNumber: signUpContainerViewController.phoneNumberTextFieldView.getText(),
                password: signUpContainerViewController.passwordTextFieldView.getText()
            )
        }
        
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
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "LoginStoryboardEmbedSegue" {
            let loginContainerViewController = segue.destination as! LoginContainerViewController
            self.loginContainerViewController = loginContainerViewController
            loginContainerViewController.delegate = self
        } else if segue.identifier == "SignUpStoryboardEmbedSegue" {
            let signUpContainerViewController = segue.destination as! SignUpContainerViewController
            self.signUpContainerViewController = signUpContainerViewController
        }
    }
    
    
    @IBAction func onValueChangedSegmenteControl(_ sender: UISegmentedControl) {
        if(sender.selectedSegmentIndex == 0) {
            loginContainerView.alpha = 1
            signUpContainerView.alpha = 0
        } else {
            loginContainerView.alpha = 0
            signUpContainerView.alpha = 1
        }
    }
    
    func startSignUp(email: String, phoneNumber: String, password: String) {
        guard !email.isEmpty else {
            print("Email is empty")
            return
        }
        
        guard !phoneNumber.isEmpty else {
            print("PhoneNumber is empty")
            return
        }
        
        guard !password.isEmpty else {
            print("Password is empty")
            return
        }
        
        performSegue(withIdentifier: "VerificationSegue", sender: nil)
    }
    
    
    func startLogin(email: String, password: String) {
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


extension AutenticationViewController: LoginContainerViewControllerDelegate {
    func clickOnForgotPassword() {
        
    }
}
