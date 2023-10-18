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
    
    
    private let skyBlueButton: SkyBlueButton = {
        let skyBlueButton = SkyBlueButton(frame: CGRect(x: 0, y: 0, width: 220, height: 55))
        skyBlueButton.configure(text: "carkis", image: UIImage(systemName: "cart")!, color: .brown)
        return skyBlueButton
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpUIComponents()
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
        skyBlueButton.widthAnchor.constraint(equalToConstant: 200).isActive = true
        skyBlueButton.heightAnchor.constraint(equalToConstant: 50).isActive = true
        skyBlueButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20).isActive = true
        skyBlueButton.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -60).isActive = true
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
        if segue.identifier == "FirstStoryboardEmbedSegue" {
            let autenticationViewController = segue.destination as! LoginContainerViewController
            autenticationViewController.comunicateDelegate = self
        } else {
            
        }
    }
    
}


extension AutenticationViewController: ComunicateDelegate {
    func clickOnLogin() {
        print("HELLO")
    }
}
