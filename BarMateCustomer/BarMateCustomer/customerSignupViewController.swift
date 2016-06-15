//
//  customerSignupViewController.swift
//  BarMateCustomer
//
//  Created by Jorge Catalan on 6/14/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit
import Firebase

class customerSignupViewController: UIViewController {
    @IBOutlet weak var customerEmailTextField: UITextField!
    @IBOutlet weak var customerPasswordTextField: UITextField!
    @IBOutlet weak var createAccountbutton: UIButton!
    
    //create buttons 
    @IBAction func createAccountButton(sender: AnyObject) {
        if customerEmailTextField.isFirstResponder(){
            resignFirstResponder()
    
        }
        // if text field are not empty enable create account buttton and create account
        if customerEmailTextField.text != "" && customerPasswordTextField.text != "" {
            
      createAccountbutton.enabled = true
            
            FIRAuth.auth()?.createUserWithEmail(customerEmailTextField.text!, password: customerPasswordTextField.text!, completion: {user, error in
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


    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set text fields to empty strings
        customerEmailTextField.text = ""
        customerPasswordTextField.text = ""
        
            }
        

 
        
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
