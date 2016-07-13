//
//  costumerLoginViewController.swift
//  BarMateCustomer
//
//  Created by Jorge Catalan on 6/14/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit
import Firebase

class customerLoginViewController: UIViewController {
    @IBOutlet weak var customerEmailTextField: UITextField!
    @IBOutlet weak var customerPasswordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    
// Create and Set Up buttons
    @IBAction func customerLoginButton(sender: AnyObject) {
        FIRAuth.auth()?.signInWithEmail(customerEmailTextField.text!, password: customerPasswordTextField.text!, completion: {user, error in
        
            if error != nil{
                let alertController = UIAlertController(title:"Error", message:(error!.localizedDescription), preferredStyle: .Alert)
                let cancelAction = UIAlertAction(title:"Cancel", style:.Cancel){(action) in
                }
                //add cancel action to alert controller
                alertController.addAction(cancelAction)
                
                //create ok alert action 
                let OkAction = UIAlertAction(title:"Try Again", style: .Default){(action) in
                }
                //add ok action to alert controller
                alertController.addAction(OkAction)
                
                // present alert action controller
                self.presentViewController(alertController, animated: true){}
                
                // if no error allow login and print success 
            }else{
                
                print("Success")
                //perform segue that moves to bars tableview controller
                self.performSegueWithIdentifier("barSegue", sender: sender)
                

                
                }
            })
    }
    @IBAction func unwindToLoginViewController(segue: UIStoryboardSegue) {
        try! FIRAuth.auth()!.signOut()
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //make button round 
        loginButton.layer.cornerRadius = 8
        
        //hide keyboard
        self.hideKeyboardWhenTappedAround()
        
        // check to see if user already loggin to skip login screen 
        FIRAuth.auth()?.addAuthStateDidChangeListener({ (auth, user) in
            if user != nil {
                self.performSegueWithIdentifier("barSegue", sender: nil)
            }
        })
    }
    
}

//dismiss keyboard when touch off of text fields
    extension UIViewController {
        func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
        func dismissKeyboard() {
        view.endEditing(true)
    }
    
}
