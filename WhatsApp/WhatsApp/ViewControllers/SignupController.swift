//
//  SignupController.swift
//  WhatsApp
//
//  Created by David Marro on 29/09/2019.
//  Copyright © 2019 David Marro. All rights reserved.
//

import UIKit
import Firebase
class SignupController: UIViewController {

//    MARK: - OUTLETS
    
    @IBOutlet weak var emailTextfield: UITextField!
    @IBOutlet weak var passwordTextfield: UITextField!
    @IBOutlet weak var signinButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
//    MARK: - ACTIONS
    @IBAction func buttonContinuePressed(_ sender: Any) {
//        creo nuovo user con firebase
        Auth.auth().createUser(withEmail: emailTextfield.text!, password: passwordTextfield.text!) { (user, error) in
            if error != nil {
                print(error)}else{
                    print("Registration Succesfull!")
                self.performSegue(withIdentifier:"goToChat", sender: self)
                }
            }
        }
    
    
}
