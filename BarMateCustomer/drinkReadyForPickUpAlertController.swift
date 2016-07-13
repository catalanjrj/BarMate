//
//  drinkReadyForPickUpAlertController.swift
//  Bar Mate
//
//  Created by Jorge Catalan on 7/12/16.
//  Copyright © 2016 Jorge Catalan. All rights reserved.
//

import UIKit
import Firebase

class drinkReadyForPickUpAlertController: UIAlertController {
    var ref : FIRDatabaseReference = FIRDatabase.database().reference()
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
    }
    
//    // create alert to notify user when their order is ready for pickup
//    func drinkReadyPopUp(){
//        _ = self.ref.child("Orders/completed/").queryOrderedByChild("bar").queryEqualToValue("aowifjeafasg").observeEventType(FIRDataEventType.ChildAdded, withBlock: {(snapshot) in
//            if snapshot.value != nil{
//                let drinkReadyAlert = UIAlertController(title:"Order Status", message: "Your drink is ready for pick up!", preferredStyle: .Alert)
//                let okAction = UIAlertAction(title:"Ok",style: .Default){(action) in
//                }
//                drinkReadyAlert.addAction(okAction)
//                //self.presentViewController(drinkReadyAlert, animated:true){}
//                
//                return self.drinkReadyPopUp()
//                
//            }else{
//                
//                return
//                
//            }
//            
//            
//            
//        })
//    }
//
//}

}