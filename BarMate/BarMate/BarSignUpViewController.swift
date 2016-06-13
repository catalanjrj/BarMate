//
//BarSignUpViewController.swift
//  BarMate
//
//  Created by Jorge Catalan on 6/10/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit
import Firebase

class BarSignUpViewController: UIViewController {
    @IBOutlet weak var EmailTextField: UITextField!
    @IBOutlet weak var PasswordTextField: UITextField!
    @IBOutlet weak var CreateAccountButton: UIButton!

    

    override func viewDidLoad() {
        super.viewDidLoad()
    
        EmailTextField.text = ""
        PasswordTextField.text = ""
        
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @IBAction func createAccountButton(sender: AnyObject) {
        if  EmailTextField.isFirstResponder() {
            EmailTextField.resignFirstResponder()
        }
        if EmailTextField.text != "" && PasswordTextField.text != ""{
            CreateAccountButton.enabled = true
        
            
    FIRAuth.auth()?.createUserWithEmail(EmailTextField.text!, password: PasswordTextField.text!, completion: {user, error in
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
                
            }else{
                let alertController = UIAlertController(title: "Success!", message:"Your Acoount has been created" , preferredStyle: .Alert)
                
                let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel) { (action) in
                    // ...
                }
                alertController.addAction(cancelAction)
                
                let OKAction = UIAlertAction(title: "Ok", style: .Default) { (action) in
                    // ...
                }
                alertController.addAction(OKAction)
                
                self.presentViewController(alertController, animated: true) {
                    
                }
               
           
           
            }
        })
        }

    }

    @IBAction func CancelButton(sender: AnyObject) {
   dismissViewControllerAnimated(true, completion: nil)
    }
//    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
//        <#code#>
//    }
    
        
    }


