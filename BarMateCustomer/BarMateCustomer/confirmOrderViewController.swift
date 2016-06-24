//
//  confirmOrderViewController.swift
//  BarMateCustomer
//
//  Created by Jorge Catalan on 6/24/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit
import Firebase

class confirmOrderViewController: UIViewController {
  
    @IBOutlet weak var drinkNameLabel: UILabel!
    @IBOutlet weak var drinkImageView: UIImageView!
    @IBOutlet weak var drinkIngredients: UILabel!
    @IBOutlet weak var drinkPrice: UILabel!
    
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
        

        drinkNameLabel.text = drink!.name
        drinkPrice.text = String(drink!.price)
        drinkIngredients.text = drink!.ingredients
    }
    
    //set up button for placing orders
    @IBAction func placeOrderButton(sender: AnyObject) {
      let newChild = self.ref.child("Orders").child("open").childByAutoId()
        
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateStyle = .ShortStyle
        dateFormatter.timeStyle = .MediumStyle
        
      
        var newOrderDict:[String:AnyObject] = ["drink":(drink?.name)!]
        newOrderDict["uid"] = newChild.key
        newOrderDict["orderTime"] = dateFormatter.stringFromDate(NSDate())
        newOrderDict["user"] = String(FIRAuth.auth()?.currentUser?.uid)
        newOrderDict["orderId"] = newChild.key
  
        

    
//
//       let childUpdates = ["/posts/\(key)": post,
//                          "/user-posts/\(userID)/\(key)/": post]
//       ref.updateChildValues(childUpdates)
         let newOrder = Order(orderData: newOrderDict)
        newChild.updateChildValues(newOrderDict)
        
    }
    
    
    
}
