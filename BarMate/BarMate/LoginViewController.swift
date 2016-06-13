//
//  LoginViewController.swift
//  BarMate
//
//  Created by Jorge Catalan on 6/10/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit
import Firebase

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    @IBAction func loginButton(sender: AnyObject) {
   FIRAuth.auth()?.signInWithEmail(emailTextField.text!, password: passwordTextField.text!, completion: {user, error in
                
                if error != nil{
                    let alertController = UIAlertController(title: "Error", message:(error!.localizedDescription) , preferredStyle: .Alert)
                    
                    let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                        // ...
                    }
                    alertController.addAction(cancelAction)
                    
                    let OKAction = UIAlertAction(title: "Try Again", style: .Default) { (action) in
                        // ...
                    }
                    alertController.addAction(OKAction)
                    
                    self.presentViewController(alertController, animated: true) {
                        
                    }
                    
                    print(error!.localizedDescription)
                }else{
                    
                    
                    
                    print("Success")
                }
            })
        }

    
    
    @IBOutlet weak var signUpButton: UIButton!
    
}