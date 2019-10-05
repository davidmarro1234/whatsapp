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
//         self.navigationController?.isNavigationBarHidden = true
    }
    

    
       // MARK: - Actions

    @IBAction func goToLogin(_ sender: Any) {
        performSegue( withIdentifier: "goToLogin", sender: self)
        
       
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        navigationController?.setNavigationBarHidden(true, animated: animated)
    }

    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        navigationController?.setNavigationBarHidden(false, animated: animated)
    }

    
    @IBAction func goToSignUp(_ sender: Any) {
        performSegue(withIdentifier: "goToSignUp", sender: self)
    }
}
