//
//  MainController.swift
//  WhatsApp
//
//  Created by David Marro on 28/09/2019.
//  Copyright © 2019 David Marro. All rights reserved.
//

import UIKit

class MainController: UIViewController {

    // MARK: - Outlets
    @IBOutlet weak var buttonLogin: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonLogin.layer.cornerRadius = 27
    }
    

       // MARK: - Actions

    @IBAction func goToLogin(_ sender: Any) {
        performSegue( withIdentifier: "goToLogin", sender: self)
        
       
    }
    


    
    @IBAction func goToSignUp(_ sender: Any) {
        performSegue(withIdentifier: "goToSignUp", sender: self)
    }
}
