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
            
                
                
                
                
            
            
            }
            
            
            
        })
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
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
