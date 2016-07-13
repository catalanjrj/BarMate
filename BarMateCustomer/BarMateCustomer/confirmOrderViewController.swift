//
//  confirmOrderViewController.swift
//  BarMateCustomer
//
//  Created by Jorge Catalan on 6/24/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit
import Firebase
import AudioToolbox

class confirmOrderViewController: UIViewController {
  
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var drinkIngredients: UILabel!
    @IBOutlet weak var drinkPrice: UILabel!
    @IBOutlet weak var placeOrderButton: UIButton!
    
    var drink: Drink?
    var ref:FIRDatabaseReference = FIRDatabase.database().reference()
    
        
    
    func configureView() {
        // Update the user interface for the detail item.
        if let detail = self.drink {
                drinkNameLabel.text = detail.name
                drinkPrice.text = String(detail.price)
                drinkIngredients.text = detail.ingredients
    
            }
            
        }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //present drinkReady Alert
        drinkReadyPopUp()
        
      
        
        //set the way placeOrderButton displays
        placeOrderButton.layer.cornerRadius = 8
        placeOrderButton.layer.borderColor = UIColor .whiteColor().CGColor
        placeOrderButton.layer.borderWidth = 1
        drinkNameLabel.text = drink!.name
        
        //set label text and formate Float
        drinkPrice.text = String(format:"$%.2f", drink!.price)
        drinkIngredients.text = drink!.ingredients
    }
    
    override func viewWillDisappear(animated: Bool) {
        super.viewWillDisappear(animated)
        
        //remove observers when user leaves view 
        self.ref.removeAllObservers()
       
     
    }
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        
  
     // self.presentViewController(drinkReadyForPickUpAlertController(), animated: true, completion: nil)

    }

        //set up button for placing orders
    @IBAction func placeOrderButton(sender: AnyObject) {
        
        //confirm that user wants to order
        let alertController = UIAlertController(title:"Confirm Order", message:"Are You Sure?", preferredStyle: .Alert)
        let cancelAction = UIAlertAction(title:"Cancel", style:.Cancel){(action) in
        }
        //add cancel action to alert controller
        alertController.addAction(cancelAction)
        
        //create ok alert action
        let OkAction = UIAlertAction(title:"Order", style: .Default){(action) in
            
        //create order and pass to firebase
            let newChild = self.ref.child("Orders").child("open").childByAutoId()
            let bar = self.ref.child("Bars").child("aowifjeafasg")
            
            let dateFormatter = NSDateFormatter()
            dateFormatter.timeStyle = .ShortStyle
            dateFormatter.dateStyle = . ShortStyle
            
            
            
            var newOrderDict:[String:AnyObject] = ["drink":(self.drink?.name)!]
            newOrderDict["uid"] = newChild.key
            newOrderDict["orderTime"] = dateFormatter.stringFromDate(NSDate())
            newOrderDict["user"] = String(FIRAuth.auth()!.currentUser!.email!)
            newOrderDict["orderId"] = newChild.key
            newOrderDict["bar"] = bar.key
            
            _ = Order(orderData: newOrderDict)
            newChild.updateChildValues(newOrderDict)
            
        //success alert!
            let successAlert = UIAlertController(title:"",message:"Success!", preferredStyle: .Alert)
            let OkAction = UIAlertAction(title:"Ok", style: .Default){(action) in
            }
            successAlert.addAction(OkAction)
            self.presentViewController(successAlert,animated:true){}
        }
        //add ok action to alert controller
        alertController.addAction(OkAction)
        
        // present alert controller
        self.presentViewController(alertController, animated: true){}
    }
    func drinkReadyPopUp(){
        _ = self.ref.child("Orders/completed/").queryOrderedByChild("bar").queryEqualToValue("aowifjeafasg").observeEventType(FIRDataEventType.ChildAdded, withBlock: {(snapshot) in
            if snapshot.value != nil{
                let drinkReadyAlert = UIAlertController(title:"Order Status", message: "Your drink is ready for pick up!", preferredStyle: .Alert)
                let okAction = UIAlertAction(title:"Ok",style: .Default){(action) in
                }
                drinkReadyAlert.addAction(okAction)
                self.presentViewController(drinkReadyAlert, animated:true){}
                // make phone vibrate and play sound when uiAlert is presented
                AudioServicesPlayAlertSound(SystemSoundID(kSystemSoundID_Vibrate))
                AudioServicesPlayAlertSound(SystemSoundID(1304))

                
                return
                
            }else{
                
                return
                
            }
            
            
            
        })
    }

    
        
        
        


    
}