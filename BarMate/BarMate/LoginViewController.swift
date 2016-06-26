//
//  LoginViewController.swift
//  BarMate
//
//  Created by Jorge Catalan on 6/10/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit
import Firebase
import FirebaseAuth

class LoginViewController: UIViewController {
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.hideKeyboardWhenTappedAround()
        
        FIRAuth.auth()?.addAuthStateDidChangeListener({ (auth, user) in
            if user != nil {
           self.performSegueWithIdentifier("OrderSegue", sender: nil)
            }
        })
        
        
    }
    
    @IBAction func unwindToLoginViewController(segue: UIStoryboardSegue) {
try! FIRAuth.auth()!.signOut()
  
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
                 self.performSegueWithIdentifier("OrderSegue", sender: sender)
                    
                }
            })
        }

    
    @IBOutlet weak var signUpButton: UIButton!
    
}
extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }



}
