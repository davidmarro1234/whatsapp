//
//  ChatViewController.swift
//  WhatsApp
//
//  Created by David Marro on 30/09/2019.
//  Copyright © 2019 David Marro. All rights reserved.
//

import UIKit
import Firebase
import ChameleonFramework

class ChatViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate {
    

    @IBOutlet weak var messageTextField: UITextField!
    
    @IBOutlet weak var heightConstraint: NSLayoutConstraint!
    
    @IBOutlet weak var sendButton: UIButton!
    @IBOutlet weak var messageTableView: UITableView!
    
    var messageArray : [Message] = [Message]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        messageTableView.delegate = self
        messageTableView.dataSource = self
        messageTextField.delegate = self
        
        
        
        

        let tapAway = UITapGestureRecognizer(target: self, action: #selector(tableViewTapped))
        messageTableView.addGestureRecognizer(tapAway)
        
//        registrazione custom cell
        messageTableView.register(UINib(nibName:"chatCell", bundle: nil), forCellReuseIdentifier: "customMessageCell")
        configureTableView()
        caricaMessaggi()

    }
    
    
    
    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("editing!!!")
        
        
        UIView.animate(withDuration: 0.3) {
            self.heightConstraint.constant = 390
            self.view.layoutIfNeeded()
        }
        
    }
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        
        UIView.animate(withDuration: 0.3) {
                   self.heightConstraint.constant = 50
                   self.view.layoutIfNeeded()
               }
        
        
    }
    
    func caricaMessaggi(){
        print("Carica messaggi")
        let messagesDB = Database.database().reference().child("messaggi")
        messagesDB.observe(.childAdded) { (snapshot) in
            
            let snapshotValue = snapshot.value as! Dictionary<String,String>
            let text = snapshotValue["Messaggio"]!
            let sender = snapshotValue["Sender"]!
            
            let message = Message()
            message.sender=sender
            message.messageBody=text
            
            self.messageArray.append(message)
            
            self.configureTableView()
            self.messageTableView.reloadData()
            
            print(text,sender)
        }
    }
    
    @objc func tableViewTapped(){
        messageTextField.endEditing(true)
    }
    
    @IBAction func logoutPress(_ sender: Any) {
        print("button pressed")
        do{
            try Auth.auth().signOut()
//            navigationController?.popToRootViewController(animated: true)
            performSegue(withIdentifier: "goToStart", sender: self)
        }
        catch{
        print("There was a problem Signing Out!")
        }
    }

    
//     MARK: - ACTIONS
    
    @IBAction func buttonLogoutPressed(_ sender: Any) {

    }
    

    
    
    
    
    
//    MARK: - TableView Methods
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "customMessageCell", for: indexPath) as! chatCell
//        let messageArray = ["First Message","hhhhmjmmmkmvlfmvlkdmfvklmdflkvmdfkmvkfmvkdflkvmdfkmvkfmvkdflkvmdfkmvkfmvkdflkvmdfkmvkfmvkdflkvmdfkmvkfmvkdflkvmdfkmvkfmvkdflkvmdfkmvkfmvkdflkvmdfkmvkfmvkdflkvmdfkmvkfmvkdflkvmdfkmvkfmvkdflkvmdfkmvkfmvkdfmvkmfkvmfkvmkfmvkfmkvmfkmvkfmvkfmvkfmkvmfkvmkf cio ciao  icoao oico fine","Third Message"]
//        cell.labelMessage.text = messageArray[indexPath.row]
        cell.labelMessage.text = messageArray[indexPath.row].messageBody
        cell.labelUser.text = messageArray[indexPath.row].sender
//        cell.imgAvatar.image = UIImage(named: "mickey")
        
        if cell.labelUser.text == Auth.auth().currentUser?.email as! String {
            cell.imgAvatar.backgroundColor = UIColor.flatMint()
            cell.backgroundMessage.backgroundColor = UIColor.flatSkyBlue()
            
        }else{
            cell.imgAvatar.backgroundColor = UIColor.flatPlum()
            cell.backgroundMessage.backgroundColor = UIColor.flatForestGreenColorDark()
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return messageArray.count
    }
    
    func configureTableView(){
        messageTableView.rowHeight = UITableView.automaticDimension
        messageTableView.estimatedRowHeight = 120.0

    }
    
    @IBAction func sendButtonPressed(_ sender: Any) {
        
        messageTextField.endEditing(true)
        
        messageTextField.isEnabled = false
        sendButton.isEnabled = false
        
        let messagesDB = Database.database().reference().child("messaggi")
        let messaggioDictionary = ["Sender": Auth.auth().currentUser?.email, "Messaggio": messageTextField.text!]
        
        messagesDB.childByAutoId().setValue(messaggioDictionary){
            (error,reference) in
            if error != nil {
                print(error)}
            else {
                print("Messaggio salvato")
                self.sendButton.isEnabled = true
                self.messageTextField.isEnabled = true
                self.messageTextField.text = ""
            }
            
            }
        
    }
    

}
