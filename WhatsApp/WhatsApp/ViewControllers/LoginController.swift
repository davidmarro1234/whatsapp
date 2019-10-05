//
//  LoginController.swift
//  WhatsApp
//
//  Created by David Marro on 29/09/2019.
//  Copyright © 2019 David Marro. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class LoginController: UIViewController {
    
//     MARK: - OUTLETS
    @IBOutlet weak var textEmail: UITextField!
    
    @IBOutlet weak var textPassword: UITextField!
    
    @IBOutlet weak var buttonContinue: UIButton!
    
    override func viewDidLoad() {
           super.viewDidLoad()

           // Do any additional setup after loading the view.
       }
       
    
    
    
    
//    MARK: - ACTIONS
    @IBAction func textPassword(_ sender: Any) {
    }
    
    @IBAction func textEmail(_ sender: Any) {
    }
    

    

    @IBAction func buttonContinuePressed(_ sender: Any) {
        print("button pressed")
        SVProgressHUD.show()
               Auth.auth().signIn(withEmail: textEmail.text!, password: textPassword.text!) { (user, error) in
                   if(error != nil){
                       print("error! ", error)}
                   else
                   {
                       print("Login Successful")
                       SVProgressHUD.dismiss()
                       self.performSegue(withIdentifier: "goToChat", sender: self)
                   }
            }
    }



}
